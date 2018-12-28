//
//  EventMonitor.swift
//  Quotes
//
//  Created by ATLAS on 2018/12/28.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Foundation

import Cocoa

public class EventMonitor {
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }
    deinit {
        stop()
    }
    
    /// When you’re ready to start listening, start() calls addGlobalMonitorForEventsMatchingMask(_:handler:), which returns an object for you to hold on to. Any time the event specified in the mask occurs, the system calls your handler.
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    ///To remove the global event monitor, you call removeMonitor() in stop() and delete the returned object by setting it to nil.
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
