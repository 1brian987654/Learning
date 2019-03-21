//
//  AppDelegate.swift
//  NSPannel
//
//  Created by ATLAS on 2019/3/21.
//  Copyright © 2019 Brian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    @IBOutlet weak var loginPanel: NSPanel!
    
    
    @IBOutlet weak var userNameField: NSTextField!
    
    @IBOutlet weak var passwordField: NSSecureTextField!
    
    
    @IBAction func loginButtonAction(_ sender: NSButton) {
        self.window.beginSheet(self.loginPanel, completionHandler: {[weak self] returnCode in
            _ = self?.userNameField.stringValue
            _ = self?.passwordField.stringValue
            print("returnCode \(returnCode)")
        })
    }
    
    @IBAction func OKButtonClick(_ sender: Any) {
        self.window.endSheet(self.loginPanel)
    }
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

