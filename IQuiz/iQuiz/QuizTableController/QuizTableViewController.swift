//
//  TableViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/27/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//
import UIKit

class QuizTableViewController: UITableViewController {
    
    
    var quizData = [
        
        [
            "picture": #imageLiteral(resourceName: "rsz_superheroes2"),
            "category" : "Superheros",
            "description": "Test your superhero comic knowledge!",
        ],
        [
            "picture": #imageLiteral(resourceName: "tvshow"),
            "category" : "Tv Shows",
            "description" : "Check to see your tv show knowledge!",
        ],
        [
            "picture": #imageLiteral(resourceName: "anime"),
            "category" : "Anime ",
            "description" : "Test your knowledge on Japense Animation!",
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
       let alert =  UIAlertController.init(title: "Settings", message: "Settings will be coming soon!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let questionVC = questionVC else {
            return
        }
        
        let _ = questionVC.view
        

        if case indexPath.row = 0 {
            
            questionVC.questionOne.text = QuizQuestions.questionData[indexPath.row]["title"]
            questionVC.responeOne.setTitle(QuizQuestions.questionData[indexPath.row]["answerOne"], for: .normal)
            questionVC.responseTwo.setTitle(QuizQuestions.questionData[indexPath.row]["answerTwo"], for: .normal)
            questionVC.responseThree.setTitle(QuizQuestions.questionData[indexPath.row]["answerThree"], for: .normal)
            questionVC.responseFour.setTitle(QuizQuestions.questionData[indexPath.row]["answerFour"], for: .normal)
            
        }
        else if case indexPath.row = 1 {
            questionVC.questionOne.text = QuizQuestions.questionData[indexPath.row]["titleTopicTwo"]
            
        } else if case indexPath.row = 2 {
            questionVC.questionOne.text = QuizQuestions.questionData[indexPath.row]["titleTopicThree"]
            
        } 
        
        questionVC.questionNum = 1
        questionVC.index = indexPath.row 
        
        self.present(questionVC, animated: true, completion: nil)
        
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
