//
//  InsuranceViewController.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit

class InsuranceViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel?
    var userIsInMiddleOfTyping = false
    
    
    @IBAction func TouchGetQuote(_ sender: UIButton) {
        let buttonName = sender.currentTitle!
        //let currentText = display!.text!
        
        print("\(buttonName) was called")
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
