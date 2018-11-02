//
//  QuizSuperHeroAnswerOneViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/29/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBAction func goToQuestions2(_ sender: Any) {
        if let questionVC2 = storyboard!.instantiateViewController(withIdentifier:"question") as? QuestionViewController {
            
            if questionNum != nil  {
                questionNum = questionNum! + 1
            }
            
            if questionNum == 1 {
                let _ = questionVC2.view
                
                self.present(questionVC2, animated: true, completion: nil)
                
            } else {
                if let resultVC = storyboard!.instantiateViewController(withIdentifier: "result") as? QuizResultViewController {
                    self.present(resultVC, animated: true, completion: nil)
                
                }
            }
        }
    }
    
    @IBOutlet weak var answerLabel: UILabel!
    var correctAnswer = 0
    var questionVC2: QuestionViewController?
    var questionNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
        
        questionNum = 1
      

    }
    

}
