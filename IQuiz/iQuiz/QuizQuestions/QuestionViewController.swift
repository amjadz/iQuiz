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
    var questionSelect = 0

    
    @IBAction func responseOne(_ sender: Any) {
        questionSelect = 1
        self.responeOne.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        responseTwo.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseThree.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseFour.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    @IBAction func responseTwo(_ sender: Any) {
        questionSelect = 2
        self.responseTwo.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        responeOne.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseThree.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseFour.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    
    @IBAction func responseThree(_ sender: Any) {
        questionSelect = 3
        self.responseThree.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        responeOne.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseTwo.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseFour.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    
    @IBAction func responseFour(_ sender: Any) {
        questionSelect = 4
        self.responseFour.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        responeOne.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseThree.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        responseTwo.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        

    }
    
    
    @IBAction func submitAnswer(_ sender: Any) {
        if questionSelect == 4 {
            correctAnswer += 1
            
        } else {
            correctAnswer += 0
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            
            
            
        }
    }
    
}
