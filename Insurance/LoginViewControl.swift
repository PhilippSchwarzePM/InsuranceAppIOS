//
//  LoginViewControl.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit


class LoginViewControl: BaseViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
   
   
    @IBAction func ContinueLoggedIn(_ sender: UIButton) {
        var sTitle = "Login Failed!"
        var sMessage = "Please check your credentials"
        var loggedon:Bool
        loggedon = brain.Login(user: username.text!, Password: password.text!)
        if loggedon{
            sTitle = "Login Successful"
            sMessage = "You have been logged on"
        }
        let alert = UIAlertController(title: sTitle, message: sMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            if loggedon{
                self.performSegue(withIdentifier: "unwindToWelcome", sender: self)
            }
        })
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? InsuranceViewController
        destinationVC?.brain = brain
    }



/*override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    
    
    if identifier == "unwindToWelcome" {
        
        return true
    }
    return false
    
}*/

    
}
