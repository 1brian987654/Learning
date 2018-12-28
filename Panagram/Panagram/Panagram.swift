//
//  Panagram.swift
//  Panagram
//
//  Created by ATLAS on 2018/12/28.
//  Copyright © 2018 ATLAS. All rights reserved.
//

import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        default: self = .unknown
        }
    }
}


class Panagram {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        //1
        let argCount = CommandLine.argc
        //2
        let argument = CommandLine.arguments[1]
        //3
        let (option, value) = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
        //let (option, value) = getOption(argument[...argument.count])
        //4
        consoleIO.writeMessage("Argument count: \(argCount) Option: \(option) value: \(value)")

    }
    
//    func getOption(_ option: String) -> (option:OptionType, value: String) {
//        return (OptionType(value: option), option)
//    }
    func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }

}
