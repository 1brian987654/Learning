//
//  QuestionStrategy.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/12.
//  Copyright © 2019 Brian. All rights reserved.
//

public protocol QuestionStrategy: class {
    // 1
    var title: String { get }
    // 2
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    // 3
    func advanceToNextQuestion() -> Bool
    // 4
    func currentQuestion() -> Question
    // 5
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    // 6 return the “index title” for the current question to indicate progress, such as "1 / 10"
    func questionIndexTitle() -> String
}
