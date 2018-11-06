//
//  QuizSuperHeroAnswerOneViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/29/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var index: Int?
    var questionSelect: Int?
    
    
    @IBAction func goToQuestions2(_ sender: Any) {
        
        if let questionVC2 = storyboard!.instantiateViewController(withIdentifier:"question") as? QuestionViewController {
            
            if questionNum == 1 {
                let _ = questionVC2.view
                
                guard let index = index else {
                    print("Unable to unwrap index")
                    fatalError()
                }
                
                if questionNum != nil {
                    questionVC2.questionNum = questionNum! + 1
                    questionVC2.index = index
                    questionVC2.questionOne.text = QuizQuestions.questionData[index]["titleQuestion2"]
                    questionVC2.responeOne.setTitle(QuizQuestions.questionData[index]["answerOneQuestion2"], for: .normal)
                    questionVC2.responseTwo.setTitle(QuizQuestions.questionData[index]["answerTwoQuestion2"], for: .normal)
                    questionVC2.responseThree.setTitle(QuizQuestions.questionData[index]["answerThreeQuestion2"], for: .normal)
                    questionVC2.responseFour.setTitle(QuizQuestions.questionData[index]["answerFourQuestion2"], for: .normal)
                    
                }
            
                self.present(questionVC2, animated: true, completion: nil)
                
                
            }
            else if (questionNum == 2) {
                if let resultVC = storyboard!.instantiateViewController(withIdentifier: "result") as? QuizResultViewController {
                        
                    let _ = resultVC.view
                        
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
        
    }
}
