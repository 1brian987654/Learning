//
//  ViewController.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/4.
//  Copyright © 2019 Brian. All rights reserved.
//

import UIKit

// MARK: - QuestionViewControllerDelegate
protocol QuestionViewControllerDelegate: class {
    
    // call it when the user presses the Cancel button
    //func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int)
    func questionViewController(_ viewController: QuestionViewController,didCancel questionGroup: QuestionStrategy)
    
    // call it when the user complete all of the questions
    //func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup)
    func questionViewController(_ viewController: QuestionViewController, didComplete questionStrategy: QuestionStrategy)
}

class QuestionViewController: UIViewController {
    
    // MARK: - Instance Properties
    public var delegate: QuestionViewControllerDelegate?
    
    public var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }
    
//    public var questionGroup: QuestionGroup! {
//        didSet {
//            navigationItem.title = questionGroup.title
//        }
//    }
    
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    // View
    public var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        return view as? QuestionView
    }

    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCancelButton()
        showQuestion()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: nil, style: .plain, target: self, action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        //delegate?.questionViewController(self, didCancel: questionGroup, at: questionIndex)
        delegate?.questionViewController(self, didCancel: questionStrategy)
    }
    
    /// you are writting code in the controller to manipulate the views based on the data in the models.
    private func showQuestion() {
        //let question = questionGroup.questions[questionIndex]
        let question = questionStrategy.currentQuestion()
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        
        //questionIndexItem.title = "\(questionIndex + 1)/\(questionGroup.questions.count)"
        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        //correctCount += 1
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionCorrect(question)
        
        //questionView.correctCountLabel.text = "\(correctCount)"
        questionView.correctCountLabel.text = String(questionStrategy.correctCount)
        
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        //incorrectCount += 1
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionIncorrect(question)
        
        //questionView.incorrectCountLabel.text = "\(incorrectCount)"
        questionView.incorrectCountLabel.text = String(questionStrategy.incorrectCount)
        
        showNextQuestion()
    }

    private func showNextQuestion() {
//        questionIndex += 1
//        guard questionIndex < questionGroup.questions.count else {
//            delegate?.questionViewController(self, didComplete: questionGroup)
//            return
//        }
        guard questionStrategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self, didComplete: questionStrategy)
            return
        }
        showQuestion()
    }
}
