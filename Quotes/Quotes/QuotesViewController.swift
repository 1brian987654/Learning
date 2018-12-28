//
//  QuotesViewController.swift
//  Quotes
//
//  Created by ATLAS on 2018/12/27.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

   
    @IBOutlet weak var textLabel: NSTextFieldCell!
    
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
}

extension QuotesViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> QuotesViewController {
        //1.
        let name = NSStoryboard.Name.init("Main")
        let storyboard = NSStoryboard(name: name, bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier.init("QuotesViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? QuotesViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

// MARK: Actions
extension QuotesViewController {
    @IBAction func previous(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    @IBAction func next(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared.terminate(sender)
    }

}

