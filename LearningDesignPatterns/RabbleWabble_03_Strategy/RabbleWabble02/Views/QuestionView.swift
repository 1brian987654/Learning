//
//  QuestionView.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/4.
//  Copyright © 2019 Brian. All rights reserved.
//

import UIKit

public class QuestionView: UIView {
    // are these shall be in controller group?
    @IBOutlet public var answerLabel: UILabel!
    @IBOutlet public var correctCountLabel: UILabel!
    @IBOutlet public var incorrectCountLabel: UILabel!
    @IBOutlet public var promptLabel: UILabel!
    @IBOutlet public var hintLabel: UILabel!
}
