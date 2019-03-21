//
//  AppDelegate.swift
//  NoUserStroyBoard
//
//  Created by ATLAS on 2019/3/20.
//  Copyright © 2019 Brian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var userNameField: NSTextField!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            let text = textField.stringValue
            if textField == self.userNameField {
                print("username:\(userNameField.stringValue)")
            }
        }
    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector == #selector(NSResponder.insertNewline(_:)) {
            print("username:\(userNameField.stringValue)")
            return true
        }
        return false
    }


}

