//
//  ViewController.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/4.
//  Copyright © 2019 Brian. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - Instance Properties
    // Model
    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    // View
    public var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        return view as! QuestionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

