//
//  Document.swift
//  PersonProfileDoc
//
<<<<<<< Updated upstream
//  Created by ATLAS on 2019/4/17.
=======
//  Created by ATLAS on 2019/4/15.
>>>>>>> Stashed changes
//  Copyright © 2019 Brian. All rights reserved.
//

import Cocoa

class Document: NSDocument {
<<<<<<< Updated upstream
    
    @objc dynamic var profile: PersonProfile?
=======
>>>>>>> Stashed changes

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
<<<<<<< Updated upstream
        profile = PersonProfile()
        profile?.image = NSImage(named: NSImage.Name.user)
=======
>>>>>>> Stashed changes
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
<<<<<<< Updated upstream
        
        let document = windowController.document as! Document
        let viewController = windowController.contentViewController as! ViewController
        viewController.bind(NSBindingName(rawValue: "profile"), to: document, withKeyPath: "profile", options: nil)
=======
>>>>>>> Stashed changes
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
<<<<<<< Updated upstream
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        return (self.profile?.docData())!
=======
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
>>>>>>> Stashed changes
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
<<<<<<< Updated upstream
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        self.profile = PersonProfile.profileFrom(data)
    }
    
    override func write(to url: URL, ofType typeName: String) throws {
        if typeName == "macdev.io.pdata" {
            return try! super.write(to: url, ofType: typeName)
        }
        if typeName == "macdev.io.pxdata" {
            let pdoc = PackageDocument()
        }
=======
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
>>>>>>> Stashed changes
    }


}

