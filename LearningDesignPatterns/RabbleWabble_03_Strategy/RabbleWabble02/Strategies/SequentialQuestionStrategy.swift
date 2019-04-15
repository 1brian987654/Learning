//
//  SequentialQuestionStrategy.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/12.
//  Copyright © 2019 Brian. All rights reserved.
//


public class SequentialQuestionStrategy: QuestionStrategy {
    
    //MARK: - Properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    
    //MARK: - Object Lifecycle
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    //MARK: - QuestionStrategy
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionGroup.questions.count > 0 else {
            return false
        }
        questionIndex = (questionIndex + 1) % questionGroup.questions.count
        return true
    }
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questionGroup.questions.count)"
    }
    
    
    //
}

