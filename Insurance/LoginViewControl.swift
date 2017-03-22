//
//  LoginViewControl.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit


class LoginViewControl: UIViewController {

    var credentials: [String:String] = [
    "philipp" : "password"
    ]
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func Login(_ sender: UIButton) {
        if credentials["philipp"]=="password"{
            print("logged in")
    }
    }

}
