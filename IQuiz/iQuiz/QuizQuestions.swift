//
//  QuizQuestions.swift
//  iQuiz
//
//  Created by Zubair Amjad on 11/1/18.
//  Copyright © 2018 Zubair Amjad. All rights reserved.
//



import Foundation

// Singleton for managing QuizData 

class QuizQuestions {
    static var questionData : [[String: String]] = [
        [
            "title": "Who is spiderman?",
            "answerOne": "Peter",
            "answerTwo": "Logan",
            "answerThree": "Reeds",
            "answerFour": "Stan",
            
            "titleQuestion2": "Who is wolverine?",
            "answerOneQuestion2": "Logan",
            "answerTwoQuestion2": "Peter",
            "answerThreeQuestion2": "Reeds",
            "answerFourQuestion2": "Stan"
            
            
        ],
        [
            "title": "Where does Game of Thrones take place?",
            "answerOne": "New Zeland",
            "answerTwo": "Australia",
            "answerThree": "America",
            "answerFour": "India",
            
            "titleQuestion2": "Where does Breaking Bad take place?",
            "answerOneQuestion2": "America",
            "answerTwoQuestion2": "Australia",
            "answerThreeQuestion2": "India",
            "answerFourQuestion2": "Jamica"
            
        ],
        [
            "title": "What anime is Midorya from?",
            "answerOne": "My Hero Acadima",
            "answerTwo": "Ghoul",
            "answerThree": "DBZ",
            "answerFour": "Captain",
            
            "titleQuestion2": "Where is goku from?",
            "answerOneQuestion2": "DBZ",
            "answerTwoQuestion2": "Captain",
            "answerThreeQuestion2": "Ghoul",
            "answerFourQuestion2": "Hero"
            
        ]
        
    ]
    
}
