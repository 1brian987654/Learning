//
//  main.swift
//  Panagram
//
//  Created by ATLAS on 2018/12/28.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Foundation

let panagram = Panagram()

if CommandLine.argc < 2 {
    //TODO: Handle interactive mode
} else {
    panagram.staticMode()
}


