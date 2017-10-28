//
//  LabelModel.swift
//  Bout Time Test
//
//  Created by Joel Strahan on 10/28/17.
//  Copyright © 2017 Joel Strahan. All rights reserved.
//

import Foundation

struct QuizLabel {
    let label1: String
    let label2: String
    let label3: String
    let label4: String
    
    func fillLabels() -> [[String]] {
        let quiz = EventSet().masterQuiz(for: .creation)
        let quizAnswers = [quiz.master, quiz.quiz]
        return quizAnswers
    }
}
