//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/9.
//  Copyright © 2019 Brian. All rights reserved.
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

// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
    
    /* This sets the selectedQuestionGroup to the one that was selected.
     You have to do this here instead of in tableView(_:, didSelectRowAt:),
     because didSelectRowAt: is triggered after the segue is performed.
     If you set selectedQuestionGroup in didSelectRowAt: then the app would crash on the line
     viewController.questionGroup = selectedQuestionGroup
     as selectedQuestionGroup would still be nil then. */
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    /* Within this function, you simply deselect the table view cell.
     This is just a nicety so you won't see any selected cells should you return to this view controller later. */ 
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /* Within this function, you guard that the segue.
     destination is actually a QuestionViewController (just in case!),
     and if so, you set its questionGroup to the selectedQuestionGroup. */
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? QuestionViewController else {
            return
        }
        viewController.questionGroup = selectedQuestionGroup
    }
}
