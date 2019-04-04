//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by ATLAS on 2019/4/2.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import UIKit
public class SelectQuestionGroupViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    // MARK: - Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
}
