//
//  AppDelegate.swift
//  Fit&Shop
//
//  Created by Killva on 5/6/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKLoginKit
import Google
import GoogleSignIn


import Firebase
import FirebaseInstanceID


let ad = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate let activityData = ActivityData()
    override init() {
        super.init()
        UIFont.overrideInitialize()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        FIRApp.configure()

        let firPar = self.getUserID() == 0 ? [:] : ["UserID":getUserID()]
        FIRAnalytics.logEvent(withName: kFIREventAppOpen, parameters: firPar)

        guard  let didShowTutorial = UserDefaults.standard.value(forKey: "didShowTutorial") as? Bool , didShowTutorial else {
            //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            //            let controller = storyboard.instantiateViewController(withIdentifier: "GuideVC") as! GuideVC
            let initialViewController = GuideViewC()
//            let  initialViewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
            
            let frame = UIScreen.main.bounds
            window = UIWindow(frame: frame)
            
            window!.rootViewController = initialViewController
            window!.makeKeyAndVisible()
            return true
        }
        
        if getUserID() != 0 {
            
                  let  initialViewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNav")
            
                    let frame = UIScreen.main.bounds
                    window = UIWindow(frame: frame)
            
                    window!.rootViewController = initialViewController
                    window!.makeKeyAndVisible()
        }
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool
    {
        //        print(url.relativeString)
        let facebookURLScheme = "fb218929132038450"
        
        if(url.scheme!.isEqual(facebookURLScheme)) {
            return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        }
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    func setupSocialLogin(_ application: UIApplication, _ launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
        GIDSignIn.sharedInstance().clientID = "857732680609-oihq2o3truk08kg995bkra435peqh5p2.apps.googleusercontent.com";
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

import NVActivityIndicatorView

extension AppDelegate  {
    
    func isLoading() {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func killLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    
    
    func saveUserLogginData(email:String?,photoUrl : String? , token : String?,name:String?,phoneNum:String?) {
        //      ////print("saving User Data email: \(String(describing: email)) , photoUrl: \(String(describing: photoUrl)),uid: \(String(describing: uid)),  , photoUrl: \(String(describing: name))")
        if email != "X" {
            if   let email = email   {
                UserDefaults.standard.setValue(email, forKey: "userEmail")
            }else{
                UserDefaults.standard.setValue(nil, forKey: "userEmail")
                
            }
        }
        if phoneNum != "X" {
            if   let phoneNum = phoneNum   {
                UserDefaults.standard.setValue(phoneNum, forKey: "phoneNum")
            }else{
                UserDefaults.standard.setValue(nil, forKey: "phoneNum")
                
            }
        }
        if photoUrl != "X" {
            
            if  let photo = photoUrl {
                UserDefaults.standard.setValue(photo, forKey: "profileImage")
                //              ////print("saing this photo : \(photo)")
            }else {
                UserDefaults.standard.setValue(nil, forKey: "profileImage")
            }
        }
        if token != "X" {
            if let newToken = token {
//                do {
//                    try Locksmith.updateData(data: ["token": newToken], forUserAccount: "token")
//                    ////print("Saved Token \(newToken)⚛️")
//                } catch {
//                    ////print("Couldn't save token ")
//                    do {
//                        try Locksmith.saveData(data: ["token": newToken], forUserAccount: "token")
//                        ////print("☸️Updated Token \(newToken)⚛️")
//
//                    } catch {
//                        ////print("Couldn't save token ")
//                    }
                }
            }else {
                ////print("📌sacingUser data Token == NIL 🖍")
//                UserDefaults.standard.setValue(nil, forKey: "hasSentPlayerID")
//                do {
//                    try Locksmith.deleteDataForUserAccount( userAccount: "token")
//                } catch {
//                    ////print("Couldn't save token ")
//                }
//            }
        }
        if name != "X" {
            
            if let name = name {
                UserDefaults.standard.setValue(name, forKey: "usreName")
            }else {
                UserDefaults.standard.setValue(nil, forKey: "usreName")
            }
        }
    }
}
