//
//  AppSettingsViewController.swift
//  RabbleWabble02
//
//  Created by ATLAS on 2019/4/17.
//  Copyright © 2019 Brian. All rights reserved.
//

import UIKit

public class AppSettingsViewController: UITableViewController {
    
    // MARK: - Properties
    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // This way, you won't have extra blank cells at the bottom of the table view.
        tableView.tableFooterView = UIView()
        
        // This ensures you'll always get back a UITableViewCell instance
        // whenever you call tableView.dequeueReusableCell(withIdentifier:for:).
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        
        // Set the label to be the name of that strategy
        cell.textLabel?.text = questionStrategyType.title()
        
        // if the appSettings.questionStrategyType is equal to the given questionStrategyType,
        // it's the currently selected strategy, which you denote with check mark.
        if appSettings.questionStrategyType == questionStrategyType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AppSettingsViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        tableView.reloadData()
    }
}
