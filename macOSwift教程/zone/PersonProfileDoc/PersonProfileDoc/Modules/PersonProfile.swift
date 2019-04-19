//
//  PersonProfile.swift
//  PersonProfileDoc
//
//  Created by ATLAS on 2019/4/17.
//  Copyright © 2019 Brian. All rights reserved.
//

import Cocoa

let kPersonKey: String = "PersonKey"
class PersonProfile: NSObject, NSCoding {
    var name: String?
    var age: NSInteger = 0
    var address: String?
    var mobile: String?
    var image: NSImage?
    
    func encode(with aCoder: NSCoder) {
        print("encodeWithCoder")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(mobile, forKey: "mobile")
        aCoder.encode(image, forKey: "image")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        print("decodeWithCoder")
        self.init(coder: aDecoder)
        
        let name = aDecoder.decodeObject(forKey: "name") as? String
        self.name = name
        
        let age = aDecoder.decodeInteger(forKey: "age") as NSInteger
        self.age = age
        
        let address = aDecoder.decodeObject(forKey: "address") as? String
        self.address = address
        
        let mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        self.mobile = mobile
        
        let image = aDecoder.decodeObject(forKey: "image") as? NSImage
        self.image = image
    }
    
    static func profileFrom(_ data: Data) -> PersonProfile {
        let unarchiver = try! NSKeyedUnarchiver(forReadingFrom: data)
        let aPerson = unarchiver.decodeObject(forKey: kPersonKey) as! PersonProfile
        return aPerson
    }
    
    func docData() -> Data {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(self, forKey: kPersonKey)
        archiver.finishEncoding()
        return data as Data
    }
    
}
