//
//  ViewController.swift
//  UITestInSwift
//
//  Created by ATLAS on 2019/1/23.
//  Copyright © 2019 ATLAS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var popUpButton: NSPopUpButtonCell!
    
    @IBOutlet weak var textShow: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dynamicDataConfig()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func popUpBtnAction(_ sender: NSPopUpButton) {
        let items = sender.itemTitles
        //当前选择的 index
        let index = sender.indexOfSelectedItem
        //选择的文本内容
        let title =  items[index]
        
        textShow.stringValue = title
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    }
    
    
    func dynamicDataConfig(){
        let items = ["1","2","3"]
        //删除默认的初始数据
        self.popUpButton.removeAllItems()
        //增加数据items
        self.popUpButton.addItems(withTitles: items)
        //设置第一行数据为当前选中的数据
        self.popUpButton.selectItem(at: 0)
        
        
        
        
        
        
        var asdf = ""
        
        if asdf.isEmpty {
            print("empty")
        }
    }
    
}

