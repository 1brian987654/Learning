//
//  ViewController.swift
//  DocumentDemo
//
//  Created by ATLAS on 2018/12/26.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var name: NSTextFieldCell!
    
    @IBOutlet weak var age: NSTextField!
    
    @IBOutlet weak var address: NSTextField!
    
    @IBOutlet weak var mobile: NSTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

