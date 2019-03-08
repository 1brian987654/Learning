//
//  ViewController.swift
//  Timer
//
//  Created by ATLAS on 2018/12/7.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timer : Timer?
    var numbershow : Int = 0
    var switchlable : Bool = false

    @IBOutlet weak var labelInfo: NSTextField!
    
    
    @IBAction func clickStartButton(_ sender: Any) {
        timer?.fireDate = Date.distantPast//计时器继续
    }
    
    @IBAction func clickStopButton(_ sender: Any) {
        timer?.fireDate = Date.distantFuture// 计时器暂停
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseNum), userInfo: nil, repeats: true)
        timer?.fireDate = Date.distantFuture// 计时器暂停
    }
    
    override func viewWillDisappear() {
        timer?.fireDate = Date.distantPast
        timer?.invalidate()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func increaseNum()
    {
        DispatchQueue.main.async {
            self.numbershow += 1
            self.labelInfo.stringValue = String(self.numbershow)
        }
    }

}

