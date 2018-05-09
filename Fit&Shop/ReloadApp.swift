//
//  ReloadApp.swift
//  Hyper
//
//  Created by admin on 2/26/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    
//    func reloadToHome() {
//        let storyb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc =  storyb.instantiateViewController(withIdentifier: "HomeNav") as? UINavigationController
//          UIApplication.shared.keyWindow?.rootViewController = vc
//    }
    
    
    func reloadWithAnimationToRegister() {
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let ud = UserDefaults.standard
//        if (ud.object(forKey: "token") != nil) {
            let storyb = UIStoryboard(name: "Main", bundle: Bundle.main)
            
            let vc  = storyb.instantiateViewController(withIdentifier: "RegisterNav") as! UINavigationController
              rootviewcontroller.rootViewController = vc
     
    }
    
    func reloadWithAnimationToHome() {
        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let ud = UserDefaults.standard
        //        if (ud.object(forKey: "token") != nil) {
        let storyb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let vc  = storyb.instantiateViewController(withIdentifier: "HomeNav") as! UINavigationController
        rootviewcontroller.rootViewController = vc
        
    }
    
    
    func saveUserLogginData(mobileNum:String?, uid : Int?,name:String?) {
        //        print("saving User Data email: \(String(describing: email)) , photoUrl: \(String(describing: photoUrl)),uid: \(String(describing: uid)),  , photoUrl: \(String(describing: name))")
        if mobileNum != "X" {
            if   let mobileNum = mobileNum   {
                UserDefaults.standard.setValue(mobileNum, forKey: "mobileNum")
            }else{
                UserDefaults.standard.setValue(nil, forKey: "mobileNum")
                
            }
        }
 
        if uid != -1 {
            
            if  let uid = uid {
                UserDefaults.standard.setValue(uid, forKey: "userId")
            }else {
                UserDefaults.standard.setValue(nil, forKey: "userId")
                 UserDefaults.standard.setValue(false, forKey: "hasSentPlayerID")
            }
        }
        if name != "X" {
            
            if let name = name {
                UserDefaults.standard.setValue(name, forKey: "usreName")
            }else {
                UserDefaults.standard.setValue(nil, forKey: "usreName")
            }
        }
    }
    
    func  getUserID() -> Int   {
        guard  let userID = UserDefaults.standard.value(forKey: "userId") as? Int else {
            //        print("error fetching userId from NSUserD.userId")
            return 0
        }
        return userID
    }
    
 
    
}

