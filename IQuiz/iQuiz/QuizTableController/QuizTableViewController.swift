//
//  TableViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/27/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//
import UIKit
//import SwiftyJSON
import Alamofire

struct QuizDesc: Decodable {
    let title: String
    let desc: String
    let questions: [Questions]
    
}

struct Questions: Decodable {
    let text: String
    let answer: String
    let answers: [Answers]
    
}

struct Answers: Decodable {
    let answerOne: String
    let answerTwo: String
    let answerThree: String
    let answerFour: String
    
}

class QuizTableViewController: UITableViewController {
    

    var url : String = ""

    var quizData = [
        
        [
            "picture": #imageLiteral(resourceName: "rsz_superheroes2"),
            "category" : "Superheros",
            "description": "Superheros!",
        ],
        [
            "picture": #imageLiteral(resourceName: "tvshow"),
            "category" : "Tv Shows",
            "description" : "Breaking Bad!",
        ],
        [
            "picture": #imageLiteral(resourceName: "anime"),
            "category" : "Anime ",
            "description" : "Dragonball Z!",
        ],
    ]
    
    
    var questionVC : QuestionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Get Reference to VC Quiz question
        
        questionVC = storyboard!.instantiateViewController(withIdentifier:"question") as? QuestionViewController
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quizData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QuizCatagoryTableViewCell

        let charcater = quizData[indexPath.row]
        
        cell.catagoryLabel?.text = charcater["category"] as? String
        cell.descriptionLabel?.text = charcater["description"] as? String
        cell.catagoryPic?.image = charcater["picture"] as? UIImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172.0
    }
    
    @IBAction func alertButton(_ sender: UIBarButtonItem) {
       let alert =  UIAlertController.init(title: "Settings", message: "Download Quiz", preferredStyle: .alert)
        
       let normalAction = UIAlertAction(title: "Exit", style: .default, handler: nil)
        
        alert.addTextField { (url: (UITextField?)) in
            url?.placeholder = "Enter url"
        }
        
        let getUrl : UIAlertAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
                self.url = (alert.textFields?.first?.text!)!
                self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(getUrl)
        alert.addAction(normalAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let jsonString = "http://tednewardsandbox.site44.com/questions.json"
        
        guard let url = URL(string: jsonString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                
                let quizzes = try JSONDecoder().decode([QuizDesc].self, from: data)
                
                print(quizzes.description)

                
            } catch let jsonErr {
                
                print("Error", jsonErr)
            }
            
        }.resume()
       
        

        guard let questionVC = questionVC else {
            return
        }
        
        let _ = questionVC.view
        
        questionVC.questionOne.text = QuizQuestions.questionData[indexPath.row]["title"]
        questionVC.responeOne.setTitle(QuizQuestions.questionData[indexPath.row]["answerOne"], for: .normal)
        questionVC.responseTwo.setTitle(QuizQuestions.questionData[indexPath.row]["answerTwo"], for: .normal)
        questionVC.responseThree.setTitle(QuizQuestions.questionData[indexPath.row]["answerThree"], for: .normal)
        questionVC.responseFour.setTitle(QuizQuestions.questionData[indexPath.row]["answerFour"], for: .normal)

        questionVC.questionNum = 1
        questionVC.index = indexPath.row 
        
        self.present(questionVC, animated: true, completion: nil)
        
    }
    @IBAction func refresh(_ sender: UIRefreshControl) {


    }
}
