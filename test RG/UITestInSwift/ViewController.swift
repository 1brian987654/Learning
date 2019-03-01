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
        //let pidPattern = "\\d+(?=(\\s+\\S+){7}untethered_script.sh\\r\\n)"
//

//        //let pidPattern = "(?<=\\s+\\d+\\s+)\\d+(?=\\s+\(str))"
//        let pidPattern = "\\d+(?=\\s+\(str))"
//        //let pidPattern = "(?<=\\d\\s+)\\d+(?=\\s+\(str).*\\r)"
//
//        do {
//            let regex = try NSRegularExpression(pattern: pidPattern, options: [])
//            let match =  regex.matches(in: source, options: [], range: NSRange(location: 0, length: source.count))
//
//            for result in match {
//                let pid = (source as NSString).substring(with: result.range)
//                if pid == "0" || pid == "1" {
//                    continue
//                }
//                print("-\(pid)-")
//            }
//
//        } catch  {
//            print("\(error)")
//            return
//        }
        
        
        killProcess(with: "", in: source)
        
    }
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - ppid: <#ppid description#>
    ///   - source: <#source description#>
    func killProcess(with ppid: String, in source: String) {
        var pidPattern: String!
        if ppid == "" {
            pidPattern = "\\d+(?=(\\s+\\S+){7}untethered_script.sh)"
        } else {
            pidPattern = "(?<=[ ]+\\d+[ ]+)\\d+(?=[ ]+\(ppid))"
            //"(?<=\\r\\n)\\s*\\d+\\s+\\d+(?=\\s+\(ppid))" //-    0 10630-
            //"\\r\\n\\s+\\d+\\s+\\d+(?=\\s+\(ppid))"
            //"(?<=[ ]+\\d+[ ]+)\\d+(?=[ ]+\(ppid))"
            //"\\d+(?=\\s+\(ppid))"
        }
        
        // to find all sub-processes of ppid
        do {
            let regex = try NSRegularExpression(pattern: pidPattern, options: [])
            let match =  regex.matches(in: source, options: [], range: NSRange(location: 0, length: source.count))
            for result in match {
                var pid = (source as NSString).substring(with: result.range)
                if pid.contains(" ") {
                    pid = pid.trimmingCharacters(in: .whitespaces)
                    if let some = pid.split(separator: " ").last {
                        pid = String(some)
                    }
                }
                
                print("ppid: -\(ppid)-has sub process:-\(pid)-")
                killProcess(with: pid, in: source)
            }
            
            // to kill ppid
            if ppid != "" {
                print("kill \(ppid)")
            }
            
        } catch {
            print(error)
        }
    }
    
    
    
    
    let source = "  UID   PID  PPID   C STIME   TTY           TIME CMD\r\n    0     1     0   0 16Jan19 ??       48408:22.84 /usr/local/sbin/launchd.development\r\n    0    28     1   0 16Jan19 ??       34937:23.39 /usr/sbin/syslogd\r\n    0    29     1   0 16Jan19 ??        26:59.57 /usr/libexec/UserEventAgent (System)\r\n    0    30     1   0 16Jan19 ??         0:00.07 /usr/local/bin/moosed\r\n  501    32     1   0 16Jan19 ??       7060:12.27 /usr/sbin/mediaserverd\r\n    0    33     1   0 16Jan19 ??       108:08.23 /usr/libexec/fseventsd\r\n    0    34     1   0 16Jan19 ??         0:00.02 /usr/local/sbin/astrisarmprobed\r\n  501    35     1   0 16Jan19 ??         0:00.03 /System/Library/Frameworks/LocalAuthentication.framework/Support/coreauthd\r\n  501    36     1   0 16Jan19 ??         0:00.28 /System/Library/PrivateFrameworks/MediaRemote.framework/Support/mediaremoted\r\n    0    37     1   0 16Jan19 ??         0:00.06 /usr/libexec/misd\r\n    0    38     1   0 16Jan19 ??         0:00.08 /usr/libexec/wifivelocityd\r\n    0    39     1   0 16Jan19 ??         1:32.44 /usr/libexec/configd\r\n    0    40     1   0 16Jan19 ??        18:49.82 /System/Library/CoreServices/powerd.bundle/powerd\r\n  501    41     1   0 16Jan19 ??         0:06.72 /usr/sbin/WirelessRadioManagerd\r\n    0    42     1   0 16Jan19 ??         0:04.12 /usr/libexec/IOMFB_bics_daemon\r\n    0    46     1   0 16Jan19 ??         0:00.07 /usr/libexec/keybagd -t 15\r\n    0    47     1   0 16Jan19 ??       1841:49.50 /usr/libexec/logd\r\n  501    49     1   0 16Jan19 ??         0:00.07 /usr/libexec/seld\r\n   33    50     1   0 16Jan19 ??         0:00.05 /usr/libexec/installd\r\n    0    52     1   0 16Jan19 ??        69:04.72 /usr/libexec/lockdownd.internal\r\n    0    54     1   0 16Jan19 ??       132:55.93 /usr/libexec/hidd.nonui\r\n  501    55     1   0 16Jan19 ??         0:00.03 /usr/sbin/fairplayd.default\r\n  501    56     1   0 16Jan19 ??         0:00.10 /usr/sbin/wirelessproxd\r\n    0    57     1   0 16Jan19 ??         0:00.04 /usr/libexec/networkdiagnosticsd\r\n  266    58     1   0 16Jan19 ??         0:00.20 /usr/libexec/timed\r\n    0    61     1   0 16Jan19 ??         0:00.10 /System/Library/PrivateFrameworks/MobileContainerManager.framework/Support/containermanagerd\r\n    0    62     1   0 16Jan19 ??         0:00.23 /usr/libexec/assertiond\r\n    0    63     1   0 16Jan19 ??        47:06.16 /usr/libexec/mobilewatchdog\r\n  501    64     1   0 16Jan19 ??         1:53.63 /usr/libexec/ptpd -t usb\r\n  501    65     1   0 16Jan19 ??         8:37.20 /System/Library/PrivateFrameworks/IAP.framework/Support/iaptransportd\r\n    0    68     1   0 16Jan19 ??         0:00.64 /System/Library/PrivateFrameworks/AppleCredentialManager.framework/AppleCredentialManagerDaemon\r\n    0    74     1   0 16Jan19 ??         8:22.25 /usr/sbin/notifyd\r\n    0    75     1   0 16Jan19 ??         0:42.59 /usr/sbin/cfprefsd daemon\r\n  241    76     1   0 16Jan19 ??         0:00.10 /usr/sbin/distnoted daemon\r\n  501    77     1   0 16Jan19 ??         0:00.31 /usr/libexec/dmd\r\n  501    78     1   0 16Jan19 ??         0:00.57 /usr/libexec/lsd\r\n   25    79     1   0 16Jan19 ??         0:23.12 /System/Library/PrivateFrameworks/WirelessDiagnostics.framework/Support/awdd\r\n  263    80     1   0 16Jan19 ??         0:13.66 /System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd\r\n    0    81     1   0 16Jan19 ??         0:00.02 /usr/libexec/pfd\r\n    0    82     1   0 16Jan19 ??         0:15.56 aslmanager\r\n  501    83     1   0 16Jan19 ??         7:57.28 /usr/libexec/lockbot\r\n   64    84     1   0 16Jan19 ??         5:26.48 /usr/libexec/securityd\r\n    0    85     1   0 16Jan19 ??         9:06.16 /usr/libexec/mobileassetd\r\n   64    86     1   0 16Jan19 ??        16:56.47 /usr/libexec/trustd\r\n  501    87     1   0 16Jan19 ??         0:03.01 /usr/libexec/nsurlsessiond\r\n    0    88     1   0 16Jan19 ??         0:00.23 /usr/libexec/nehelper\r\n  501    89     1   0 16Jan19 ??         1:48.81 /usr/libexec/dasd\r\n    0    90     1   0 16Jan19 ??         0:00.15 /System/Library/Frameworks/Security.framework/CloudKeychainProxy.bundle/CloudKeychainProxy\r\n    0    91     1   0 16Jan19 ??         1:42.65 /usr/libexec/biometrickitd\r\n  501    93     1   0 16Jan19 ??         0:45.76 /System/Library/PrivateFrameworks/ApplePushService.framework/apsd\r\n  501    94     1   0 16Jan19 ??         0:27.09 /usr/libexec/coreduetd\r\n    0    95     1   0 16Jan19 ??         0:00.05 /usr/libexec/OTATaskingAgent server-init\r\n  501    96     1   0 16Jan19 ??         1:01.60 /usr/libexec/mobileactivationd\r\n  501    97     1   0 16Jan19 ??         0:01.42 /System/Library/PrivateFrameworks/ManagedConfiguration.framework/Support/profiled\r\n  501    98     1   0 16Jan19 ??         0:00.06 /System/Library/PrivateFrameworks/TCC.framework/tccd\r\n    0    99     1   0 16Jan19 ??         0:00.07 /usr/libexec/tailspind\r\n  501   100     1   0 16Jan19 ??        15:50.70 /System/Library/PrivateFrameworks/CoreDuetContext.framework/Resources/contextstored\r\n    0   101     1   0 16Jan19 ??         0:00.04 /System/Library/PrivateFrameworks/MobileInstallation.framework/XPCServices/com.apple.MobileInstallationHelperService.xpc/com.apple.MobileInstallationHelperService\r\n   24   102     1   0 16Jan19 ??         0:59.49 /usr/libexec/symptomsd\r\n    0   103     1   0 16Jan19 ??         6:12.82 /usr/libexec/hangtracerd\r\n  501   104     1   0 16Jan19 ??         0:00.02 /usr/libexec/misagent\r\n   65   105     1   0 16Jan19 ??         1:19.25 /usr/sbin/mDNSResponder\r\n  501   106     1   0 16Jan19 ??         0:00.04 /usr/libexec/MobileGestaltHelper\r\n    0   107     1   0 16Jan19 ??         0:04.41 /usr/libexec/diagnosticd\r\n    0   108     1   0 16Jan19 ??         2:17.99 /usr/sbin/mDNSResponderHelper\r\n    0   109     1   0 16Jan19 ??         0:00.04 /usr/libexec/MobileStorageMounter\r\n  501   110     1   0 16Jan19 ??         0:01.18 /System/Library/Frameworks/Accounts.framework/accountsd\r\n  501   111     1   0 16Jan19 ??         0:00.19 /System/Library/PrivateFrameworks/GeoServices.framework/geod\r\n  501   112     1   0 16Jan19 ??         0:00.07 /System/Library/PrivateFrameworks/CoreFollowUp.framework/followupd\r\n  501   118     1   0 16Jan19 ??         0:00.07 /usr/libexec/sensorkitd\r\n    0   119     1   0 16Jan19 ??         0:00.02 /System/Library/PrivateFrameworks/CoreSymbolication.framework/coresymbolicationd\r\n  501   122     1   0 16Jan19 ??         0:00.45 /usr/libexec/networkserviceproxy\r\n  501   123     1   0 16Jan19 ??         0:00.33 /usr/sbin/applecamerad\r\n    0   125     1   0 16Jan19 ??         0:00.02 /usr/libexec/xartstoraged\r\n    0   126     1   0 16Jan19 ??         0:00.53 /usr/local/bin/bbswbypass\r\n    0   127     1   0 16Jan19 ??         0:07.68 /usr/local/libexec/hidrecorderd.internal\r\n  501   128     1   0 16Jan19 ??         0:11.88 /System/Library/Frameworks/Metal.framework/XPCServices/MTLCompilerService.xpc/MTLCompilerService\r\n  501   129     1   0 16Jan19 ??         0:00.26 /System/Library/Frameworks/Metal.framework/XPCServices/MTLCompilerService.xpc/MTLCompilerService\r\n    0   130     1   0 16Jan19 ??         0:00.07 /usr/libexec/nesessionmanager\r\n  501   131     1   0 16Jan19 ??         0:00.53 /usr/libexec/nfcd\r\n  501   134     1   0 16Jan19 ??         0:00.02 /usr/libexec/notification_proxy -i\r\n  501   135     1   0 16Jan19 ??         0:00.10 /usr/libexec/aned\r\n  501   136     1   0 16Jan19 ??         0:00.02 /usr/libexec/heartbeatd\r\n    0   137     1   0 16Jan19 ??        85:58.82 /AppleInternal/Applications/SwitchBoard.app/SwitchBoard\r\n    0   138     1   0 16Jan19 ??         0:03.69 /System/Library/Frameworks/Metal.framework/XPCServices/MTLCompilerService.xpc/MTLCompilerService\r\n    0   139     1   0 16Jan19 ??         0:00.16 /System/Library/Frameworks/Metal.framework/XPCServices/MTLCompilerService.xpc/MTLCompilerService\r\n    0   142     1   0 16Jan19 ??         0:00.44 /usr/local/libexec/factoryprocessd\r\n  501   145     1   0 16Jan19 ??         0:00.13 /usr/libexec/notification_proxy\r\n  501   160     1   0 16Jan19 ??         0:00.09 /usr/libexec/afcd\r\n  501   161     1   0 16Jan19 ??         0:00.02 /usr/libexec/mobile_assertion_agent\r\n  501   377     1   0 16Jan19 ??         0:00.26 /usr/libexec/diagnosticextensionsd\r\n  501   378     1   0 16Jan19 ??         0:00.08 /System/Library/CoreServices/EscrowSecurityAlert.app/EscrowSecurityAlert\r\n    0   379     1   0 16Jan19 ??         0:00.06 /usr/libexec/online-auth-agent\r\n    0  2351     1   0 16Jan19 ??         0:03.39 /usr/sbin/spindump\r\n    0  8675     1   0 19Jan19 ??         0:00.16 /usr/libexec/pkd\r\n    0 10624     1   0 22Jan19 ??         0:00.02 /bin/sh coex_fatp/untethered_script.sh\r\n    0 10630 10624   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 23456 10624   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 10716     1   0 22Jan19 ??         0:00.01 /bin/sh coex_fatp/untethered_script.sh\r\n    0 10721 10716   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 10818     1   0 22Jan19 ??         0:00.01 /bin/sh coex_fatp/untethered_script.sh\r\n    0 10823 10818   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 11051     1   0 22Jan19 ??         0:00.01 /bin/sh coex_fatp/untethered_script.sh\r\n    0 11056 11051   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 11135     1   0 22Jan19 ??         0:00.02 /bin/sh coex_fatp/untethered_script.sh\r\n    0 11140 11135   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n    0 11977     1   0 Sat07PM ??         0:00.26 /usr/libexec/crash_mover\r\n  501 11978     1   0 Sat07PM ??         0:01.30 /usr/libexec/afcd -r\r\n    0 12012     1   0 Sun06PM ??         1:20.17 /usr/libexec/sandboxd -s\r\n  501 12013     1   0 Sun06PM ??         0:02.04 /usr/libexec/rtcreportingd\r\n  501 12014     1   0 Sun06PM ??         0:00.05 /usr/libexec/nsurlstoraged\r\n    0 12110     1   0 Wed11AM ??         0:03.71 /usr/local/sbin/dropbear -i -R\r\n    0 12485     1   0 Wed11AM ??         0:06.87 /usr/local/sbin/dropbear -i -R\r\n    0 13209     1   0 Wed11AM ??         0:00.12 /usr/local/sbin/dropbear -i -R\r\n    0 13213     1   0 Wed11AM ??         0:09.60 /usr/local/sbin/dropbear -i -R\r\n    0 14208     1   0 Wed01PM ??         0:00.28 /usr/local/sbin/dropbear -i -R\r\n    0 14231     1   0 Wed02PM ??         0:00.15 /usr/local/sbin/dropbear -i -R\r\n    0 14271     1   0 Thu03PM ??         0:00.72 /usr/local/sbin/dropbear -i -R\r\n    0 14335     1   0 Thu03PM ??         0:00.70 /usr/local/sbin/dropbear -i -R\r\n    0 14404     1   0 Thu03PM ??         0:00.71 /usr/local/sbin/dropbear -i -R\r\n    0 14468     1   0 Thu03PM ??         0:00.72 /usr/local/sbin/dropbear -i -R\r\n    0 14532     1   0 Thu03PM ??         0:00.71 /usr/local/sbin/dropbear -i -R\r\n    0 14596     1   0 Thu03PM ??         0:00.72 /usr/local/sbin/dropbear -i -R\r\n    0 14660     1   0 Thu03PM ??         0:00.72 /usr/local/sbin/dropbear -i -R\r\n    0 14727     1   0  4:49PM ??         0:00.73 /usr/local/sbin/dropbear -i -R\r\n    0 14792     1   0  5:04PM ??         0:00.71 /usr/local/sbin/dropbear -i -R\r\n    0 14856     1   0  5:06PM ??         0:00.70 /usr/local/sbin/dropbear -i -R\r\n    0 14921     1   0  5:09PM ??         0:00.71 /usr/local/sbin/dropbear -i -R\r\n    0 14986     1   0  6:01PM ??         0:00.74 /usr/local/sbin/dropbear -i -R\r\n    0 15051     1   0  6:39PM ??         0:00.74 /usr/local/sbin/dropbear -i -R\r\n  501 15119     1   0  6:49PM ??         1:44.51 /System/Library/PrivateFrameworks/AggregateDictionary.framework/Support/aggregated\r\n    0 15153     1   0  6:53PM ??         0:00.12 /usr/local/sbin/dropbear -i -R\r\n    0 15156     1   0  6:54PM ??         0:00.72 /usr/local/sbin/dropbear -i -R\r\n    0 15223     1   0  7:03PM ??         0:01.55 /usr/local/sbin/dropbear -i -R\r\n    0 15316     1   0 10:18AM ??         0:00.08 /usr/local/sbin/dropbear -i -R\r\n    0 18775     1   0 10:58AM ??         0:01.56 /usr/local/sbin/dropbear -i -R\r\n    0 18846     1   0 11:02AM ??         0:00.09 /usr/local/sbin/dropbear -i -R\r\n    0 19663     1   0 11:03AM ??         0:00.09 /usr/local/sbin/dropbear -i -R\r\n    0 25705     1   0 11:12AM ??         0:00.75 /usr/local/sbin/dropbear -i -R\r\n    0 25787     1   0  2:50PM ??         0:00.56 /usr/local/sbin/dropbear -i -R\r\n    0 25863     1   0  2:52PM ??         0:00.00 sleep 500000000000000000000000000000000000000000000000000000000000\r\n    0 25878     1   0  3:16PM ??         0:00.51 /usr/local/sbin/dropbear -i -R\r\n    0 25953     1   0  3:18PM ??         0:00.12 /Developer/usr/libexec/sysmond\r\n    0 25971     1   0  4:01PM ??         0:00.12 /usr/local/sbin/dropbear -i -R\r\n    0    53     1   0 16Jan19 ??         0:00.05 login -p1 rrroot\r\n    0  9612    53   0 22Jan19 ??         0:03.05 -sh\r\n    0 15317 15316   0 10:18AM ttys000    0:00.01 -sh\r\n    0 15330     1   0 10:18AM ttys000    1:36.93 colortest -l /var/root/coex_fatp/red64_1.jpg\r\n    0 18774     1   0 10:27AM ttys000    1:35.05 colortest -l /var/root/coex_fatp/green64_1.jpg\r\n    0 18847 18846   0 11:02AM ttys001    0:00.01 -sh\r\n    0 18885     1   0 11:02AM ttys001    1:26.45 colortest -l /var/root/coex_fatp/red64_1.jpg\r\n    0 25221     1   0 11:07AM ttys001    1:25.26 colortest -l /var/root/coex_fatp/green64_1.jpg\r\n    0 19664 19663   0 11:03AM ttys002    0:00.01 -sh\r\n    0 19766     1   0 11:04AM ttys002    1:26.43 colortest -l /var/root/coex_fatp/red64_1.jpg\r\n    0 25704     1   0 11:08AM ttys002    1:24.26 colortest -l /var/root/coex_fatp/green64_1.jpg\r\n    0 25975 25971   0  4:01PM ttys003    0:00.01 ps -ef\r\n    0 32145 10624   0 22Jan19 ??         0:00.00 sleep 5000000000000\r\n"
    
}

