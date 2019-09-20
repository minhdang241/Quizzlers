//
//  Question.swift
//  Quizzler
//
//  Created by Minh, Dang Ba on 9/19/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText:String
    let correctAnswer:Bool
    
    init(text:String, correctAnswer:Bool) {
        
        self.questionText = text
        self.correctAnswer = correctAnswer
        
    }
}

