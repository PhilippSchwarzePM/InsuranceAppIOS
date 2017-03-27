//
//  HomeWindowBrain.swift
//  Insurance
//
//  Created by Philipp Schwarze on 22/03/2017.
//  Copyright © 2017 Philipp Schwarze. All rights reserved.
//

import Foundation

struct HomeWindowBrain{
    public var balance:Double = 400.15
    public var isLoggedOn:Bool?
    public var userName:String?
    private var credentials: [String:String] = [
        "philipp" : "pass",
        "ps":"rocks"
    ]
    
    mutating func Login (user:String, Password:String) -> Bool{
        if credentials[user]==Password{
            isLoggedOn=true
            userName=user
            return true
        }
        return false
    }
    mutating func LogOut(){
        isLoggedOn=nil
        userName=nil
    }
    
    mutating func sendMoney(sendAmount:Double) -> Bool{
        balance = balance - sendAmount
        return true
    }
}
