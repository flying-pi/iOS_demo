//
//  ViewController.swift
//  iosClient
//
//  Created by Yura Braiko on 13.03.17.
//  Copyright © 2017 Yura Braiko. All rights reserved.
//

import UIKit
import iosLibr

class ViewController: UIViewController {

    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let test = Toster(name: "Krot")
        label.text = test.on()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

