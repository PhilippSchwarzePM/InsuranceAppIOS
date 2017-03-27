//
//  InsuranceViewController.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit

class InsuranceViewController: BaseViewController, MyProtocol {
    
    
    @IBOutlet weak var titleLoginButton: UIBarButtonItem!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    @IBOutlet weak var balanceamount: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    var clicked = false;
    
    @IBOutlet weak var welcomeName: UILabel!
    
    @IBAction func TouchGetQuote(_ sender: UIButton) {
        let buttonName = sender.currentTitle!
        //let currentText = display!.text!
        
        print("\(buttonName) was called")
        if buttonName=="Get a Quote"
        {
            print("clicked!")
            print("\(brain.isLoggedOn)")
            clicked=true
        }
        
    }
    
    func setResultOfBusinessLogic(controller: MoneyViewController, thebrain: HomeWindowBrain) {
        brain=thebrain
        //controller.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        setLogonState()

    }
    
    func setLogonState()
    {
        if let _:Bool = brain.isLoggedOn,
            brain.isLoggedOn!{
            welcomeName.text = "Welcome "+brain.userName!+"!"
            //titleBar.title = "Hi, "+brain.userName!+"!"
            //btnLogin.isHidden=true
            //btnLogout.isHidden=false
            titleLoginButton.title="Log out"
        }
        else
        {
            
            welcomeName.text = "Welcome"
            //titleBar.title = "Welcome"
            //btnLogin.isHidden=false
            //btnLogout.isHidden=true
            titleLoginButton.title="Log in"
        }
    }
    
    @IBAction func calclabel(_ sender: UIButton) {
        balanceamount.text = String (brain.balance)
    }
    func Logout() {
        brain.LogOut()
        let sTitle = "LogOut"
        let sMessage = "You have been logged out"
        let alert = UIAlertController(title: sTitle, message: sMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
        setLogonState()
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // Create a new variable to store the instance of PlayerTableViewController
        //if segue.identifier=="sendMoney"{
        if segue.identifier=="login"{
            if let loggedin = brain.isLoggedOn{
                Logout()
            }
        }
        else {
            
            let destinationVC = segue.destination as? BaseViewController
            destinationVC?.brain = self.brain
            if segue.identifier=="sendMoney"{
                if let loggedin = brain.isLoggedOn{
                    let vc = segue.destination as? MoneyViewController
                    vc?.delegate = self
                    }
                else {
                    let sTitle = "Client Area"
                    let sMessage = "You need to logon to access this functionality"
                    let alert = UIAlertController(title: sTitle, message: sMessage, preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                    
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        // print(destinationVC?.brain.isLoggedOn.description)
        //}
        
    }
    @IBAction func unwindToWelcomeScreen(_ segue: UIStoryboardSegue) {}
    
    
}
