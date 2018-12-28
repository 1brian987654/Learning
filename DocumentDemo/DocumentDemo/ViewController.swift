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
    
    var person = PersonProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.stringValue = person.name
        age.stringValue = person.age
        address.stringValue = person.address
        mobile.stringValue = person.mobile
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

