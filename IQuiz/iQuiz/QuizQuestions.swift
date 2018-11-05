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
            "title": "Who is spiderman",
            "answerOne": "Peter",
            "answerTwo": "Logan",
            "answerThree": "Reeds",
            "answerFour": "Stan"
            
        ],
        [
            "titleTopicTwo": "Where does Game of Thrones take place?",
            "answerOneTopicTwo": "Placeholder",
            "answerTwoTopicTwo": "Placeholder",
            "answerThreeTwoTopicTwo": "Placeholder",
            "answerFourTopicTwo": "Placeholder"
        ],
        [
            "titleTopicThree": "What anime is Midorya from?",
            "answerOneTopicThree": "Placeholder",
            "answerTwoTopicThree": "Placeholder",
            "answerThreeTwoTopicThree": "Placeholder",
            "answerFourTopicThree": "Placeholder"
        ],
        [
            "titleTopicFour": "Lit",
            "answerOneTopicThree": "Placeholder",
            "answerTwoTopicThree": "Placeholder",
            "answerThreeTwoTopicThree": "Placeholder",
            "answerFourTopicThree": "Placeholder"
        ]
    ]
}
