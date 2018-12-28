//
//  PersonProfile.swift
//  DocumentDemo
//
//  Created by ATLAS on 2018/12/26.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Cocoa

class PersonProfile: NSObject {
    var name: String
    var age: String
    var address: String
    var mobile: String

    override init() {
        name = ""
        age = ""
        address = ""
        mobile = ""
    }
}
