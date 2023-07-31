//
//  Question.swift
//  Quizz-MultiChoices
//
//  Created by Ahmed Alaa on 13/04/2023.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
