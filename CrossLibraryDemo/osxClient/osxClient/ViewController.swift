//
//  ViewController.swift
//  osxClient
//
//  Created by Yura Braiko on 13.03.17.
//  Copyright © 2017 Yura Braiko. All rights reserved.
//

import Cocoa
import osxLibr

class ViewController: NSViewController {

    @IBOutlet var label: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = Toster(name: "Tomas")
        label.stringValue = test.on()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

