//
//  ViewController.swift
//  Insurance
//
//  Created by Philipp Schwarze on 21/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel?
    var userIsInMiddleOfTyping = false

    
    @IBAction func TouchGetQuote(_ sender: UIButton) {
        let buttonName = sender.currentTitle!
        //let currentText = display!.text!
        
       print("\(buttonName) was called")
    
    }
}

