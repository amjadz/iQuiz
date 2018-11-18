//
//  TableViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/27/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//
import UIKit
import SVProgressHUD

struct QuizDesc: Codable, CustomStringConvertible {
    let title: String
    let desc: String
    let questions: [Question]
    
    var description: String {
        return "\(title), \(desc))"
        
    }
    
}

struct Question: Codable {
    let text: String
    let answer: String
    let answers: [String]
    
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
        
        SVProgressHUD.show()
        
        getData { quizTitleAndDesc in
            SVProgressHUD.dismiss()
            
            DispatchQueue.main.async {
                cell.catagoryLabel?.text = quizTitleAndDesc[indexPath.row].title
                cell.descriptionLabel?.text = quizTitleAndDesc[indexPath.row].description
                //        cell.catagoryPic?.image = charcater["picture"] as? UIImage
            }
        }
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
        
        
        guard let questionVC = questionVC else {
            return
        }
        
        let _ = questionVC.view
        
        SVProgressHUD.show()
        
        getData(completion: { quizDataResponse in
            SVProgressHUD.dismiss()
            DispatchQueue.main.async {
                questionVC.questionOne.text = quizDataResponse[indexPath.row].questions[0].text
                questionVC.responeOne.setTitle(quizDataResponse[indexPath.row].questions[0].answers[0], for: .normal)
                questionVC.responseTwo.setTitle(quizDataResponse[indexPath.row].questions[0].answers[1], for: .normal)
                questionVC.responseThree.setTitle(quizDataResponse[indexPath.row].questions[0].answers[2], for: .normal)
                questionVC.responseFour.setTitle(quizDataResponse[indexPath.row].questions[0].answers[3], for: .normal)
                
            }
            
        })
        
        
        
        
        self.present(questionVC, animated: true, completion: nil)
        
    }
    
    let pullToRefreshIsRunning: Bool = false

    @IBAction func refresh(_ sender: UIRefreshControl) {
        
        getData { refreshData in
            SVProgressHUD.dismiss()
        }
        
        if pullToRefreshIsRunning == false {
            SVProgressHUD.show()
        }

        sender.endRefreshing()
        
    }
    
    func getData(completion: @escaping (([QuizDesc]) -> Void)) {
        var quizzes: [QuizDesc]? = nil
        
        let jsonString = "http://tednewardsandbox.site44.com/questions.json"
        
        guard let url = URL(string: jsonString) else {
            print("Unable to Convert String")
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do {
                quizzes = try JSONDecoder().decode([QuizDesc].self, from: data)
                completion(quizzes!)
                
            } catch let jsonErr {
                print("Error", jsonErr)
                
            }
            
            }.resume()
    }
    
}

