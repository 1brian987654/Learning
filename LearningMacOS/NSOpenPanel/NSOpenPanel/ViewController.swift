//
//  ViewController.swift
//  NSOpenPanel
//
//  Created by ATLAS on 2019/3/21.
//  Copyright © 2019 Brian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    @IBOutlet weak var textView: NSScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func openFilePanel(_ sender: AnyObject) {
        let openDlg = NSOpenPanel()
        openDlg.canChooseFiles = true
        openDlg.canChooseDirectories = false
        openDlg.allowsMultipleSelection = false
        openDlg.allowedFileTypes = ["txt"]
        
        openDlg.begin(completionHandler: {[weak self] result in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                let fileURLs = openDlg.urls
                for url: URL in fileURLs {
                    guard let string = try? NSString.init(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue) else {
                        return
                    }
                    self?. = string as String
                }
            }
        })
    }


}

