//
//  MoneyViewController.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func setResultOfBusinessLogic(controller: MoneyViewController, thebrain: HomeWindowBrain)
}

class MoneyViewController: BaseViewController{

    var delegate:MyProtocol? = nil
    @IBOutlet weak var txtBalance: UITextField!
    @IBOutlet weak var txtSendMoney: UITextField!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
/*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? BaseViewController
        destinationVC?.brain = brain
        print("####PREPARE FOR SEGUE")
    }
*/
    var displayResult: Double {
        get{
            return Double(txtBalance.text!)!-Double(txtSendMoney.text!)!
        }
        set{
            txtBalance.text = String()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        txtBalance.text = String (brain.balance)
    }

    @IBAction func TestVariables(_ sender: UIButton) {
        if let amount = txtSendMoney.text{
            print ("Amount is:"+amount+"_")
            if let x = Double (amount){
                print ("x is: "+String(x)+"_")
                brain.sendMoney(sendAmount: x)
                txtSendMoney.text=""
            }
            
        }
        
        txtBalance.text = String (brain.balance)
        print("calling delegate")
        delegate?.setResultOfBusinessLogic(controller: self, thebrain: brain)
        
    }
}
