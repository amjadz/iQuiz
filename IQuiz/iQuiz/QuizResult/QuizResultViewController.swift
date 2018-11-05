//
//  QuizResultViewController.swift
//  iQuiz
//
//  Created by Zubair Amjad on 10/31/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//

import UIKit

class QuizResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var string = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        scoreLabel.text = string
        
        
    }
}
