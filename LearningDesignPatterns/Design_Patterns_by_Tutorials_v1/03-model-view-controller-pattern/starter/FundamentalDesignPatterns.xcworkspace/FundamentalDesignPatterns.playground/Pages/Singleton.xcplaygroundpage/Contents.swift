/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Singleton
 - - - - - - - - - -
 ![Singleton Diagram](Singleton_Diagram.png)
 
 The singleton pattern restricts a class to have only _one_ instance.
 
 The "singleton plus" pattern is also common, which provides a "shared" singleton instance, but it also allows other instances to be created too.
 
 ## Code Example
 */
import UIKit

//MARK: - Singleton
let app = UIApplication.shared


public class MySingleton {
    
    static let shared = MySingleton()
    
    private init() {}
}

let mySingleton =  MySingleton.shared
let test = MySingleton.shared

let defaultFileManager = FileManager.default
let customfileManager = FileManager()

public class MySingletonPlus {
    static let shared = MySingletonPlus()
    public init() {}
}

let sinPlus = MySingletonPlus.shared
let sinPlus2 = MySingletonPlus()

