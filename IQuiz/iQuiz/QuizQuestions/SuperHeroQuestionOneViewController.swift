//
//  SuperHeroQuestionViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/29/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class SuperHeroQuestionOneViewController: UIViewController {

    @IBOutlet weak var questionOne: UILabel!
    
    
    @IBOutlet weak var responeOne: UIButton!
    
    
    @IBOutlet weak var responseTwo: UIButton!
    
    
    @IBOutlet weak var responseThree: UIButton!
    
    
    @IBOutlet weak var responseFour: UIButton!
    
    
    var correctAnswer = 0
    
    @IBAction func responseOne(_ sender: Any) {
        if responeOne != nil{
            self.responeOne.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)

        } else if responeOne == nil {
            self.responeOne.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        }
    }
    
    @IBAction func responseTwo(_ sender: Any) {
        self.responseTwo.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)

    }
    
    
    @IBAction func responseThree(_ sender: Any) {
        self.responseThree.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)

    }
    
    
    @IBAction func responseFour(_ sender: Any) {
        self.responseFour.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)

    }
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        if responeOne != nil {
            correctAnswer += 1
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let spiderManAnswerVC = segue.destination as! SuperHeroAnswerOneViewController
        
        
       spiderManAnswerVC.answerLabel = responeOne.titleLabel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
