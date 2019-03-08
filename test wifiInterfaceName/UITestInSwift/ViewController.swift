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
        
        
        // 1. 创建正则表达式规则
        let pidPattern = "\\b\\w+\\b(?=: flags)"

        do {
            let regex = try NSRegularExpression(pattern: pidPattern, options: [])
            let match =  regex.matches(in: source, options: [], range: NSRange(location: 0, length: source.count))

            for result in match {
                let pid = (source as NSString).substring(with: result.range)
                print("-\(pid)-")
            }

        } catch  {
            print("\(error)")
            return
        }
        
    }
    
    
    let source = "lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384 rtref 0 index 1\r\n\teflags=12000000<ECN_DISABLE,SENDLIST>\r\n\toptions=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>\r\n\tinet 127.0.0.1 netmask 0xff000000 \r\n\tinet6 ::1 prefixlen 128 \r\n\tinet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 \r\n\tnd6 options=201<PERFORMNUD,DAD>\r\n\tlink quality: 100 (good)\r\n\tstate availability: 0 (true)\r\n\ttimestamp: disabled\r\n\tqosmarking enabled: no mode: none\r\n\tlow power mode: disabled\r\npdp_ip0: flags=8010<POINTOPOINT,MULTICAST> mtu 1500 rtref 0 index 2\r\n\teflags=c004080<TXSTART,EXPENSIVE,CHANNEL_DRV,CA>\r\n\toptions=400<CHANNEL_IO>\r\n\tnetif: C884E1F7-5E95-4D99-88EF-4938BFC16434\r\n\ttype: Cellular\r\n\tstate availability: 0 (true)\r\n\tscheduler: FQ_CODEL \r\n\tqosmarking enabled: no mode: none\r\n\tlow power mode: disabled\r\nUDC0: flags=0<> mtu 0 rtref 0 index 3\r\n\teflags=1000000<ECN_ENABLE>\r\n\tstate availability: 0 (true)\r\n\tqosmarking enabled: no mode: none\r\n\tlow power mode: disabled\r\npdp_ip4: flags=8010<POINTOPOINT,MULTICAST> mtu 1500 rtref 0 index 4\r\n\teflags=c0040"
    
}

