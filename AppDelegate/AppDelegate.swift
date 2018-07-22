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


import UserNotifications
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

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
//        FIRApp.configure()
        setupFCM()

        let firPar = self.getUserID() == 0 ? [:] : ["UserID":getUserID()]
        FIRAnalytics.logEvent(withName: kFIREventAppOpen, parameters: firPar)

        guard self.getUserID() != 0  else {  //let didShowTutorial = UserDefaults.standard.value(forKey: "didShowTutorial") as? Bool , didShowTutorial else {
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



extension AppDelegate : UNUserNotificationCenterDelegate, FIRMessagingDelegate
{
    
    
    //    func setupFCM(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
    //
    //        if #available(iOS 10.0, *) {
    //            // For iOS 10 display notification (sent via APNS)
    //            UNUserNotificationCenter.current().delegate = self
    //            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    //            UNUserNotificationCenter.current().requestAuthorization(
    //                options: authOptions,
    //                completionHandler: {_, _ in })
    //            // For iOS 10 data message (sent via FCM
    //            FIRMessaging.messaging().remoteMessageDelegate = self
    //        } else {
    //            let settings: UIUserNotificationSettings =
    //                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
    //            application.registerUserNotificationSettings(settings)
    //        }
    //
    //        application.registerForRemoteNotifications()
    //
    //        FIRApp.configure()
    //    }
    //    // The callback to handle data message received via FCM for devices running iOS 10 or above.
    //    func applicationReceivedRemoteMessage(_ remoteMessage: FIRMessagingRemoteMessage) {
    //        print(remoteMessage.appData)
    //    }
    //
    //    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    //        print("APNs token retrieved: \(deviceToken)")
    ////        FIRMessaging.messaging().apnsToken = deviceToken
    ////
    ////        print("Token is here   \(String(describing: FIRMessaging.messaging().fcmToken))")
    ////        print("Token is here   \(String(describing: Messaging.messaging().apnsToken))")
    ////
    ////
    ////
    ////        if UserDefaults.standard.object(forKey: "FCM_Token") == nil
    ////        {
    ////            UserDefaults.standard.set(Messaging.messaging().fcmToken, forKey: "FCM_Token")
    ////        }
    ////        else
    ////        {
    ////            let fcmSavedToken = UserDefaults.standard.value(forKey: "FCM_Token") as! String
    ////            if fcmSavedToken == Messaging.messaging().fcmToken
    ////            {
    ////
    ////            }
    ////            else
    ////            {
    ////                UserDefaults.standard.set(Messaging.messaging().fcmToken, forKey: "FCM_Token")
    ////            }
    //
    //
    //        }
    //
    //
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //        print(response)
        //            print("Handle push from background or closed\(response.notification.request.content.userInfo)")
        //write your action here
    }
    
    // This method will be called when app received push notifications in foreground
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    
    
    
    func setupFCM() {
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            // For iOS 10 data message (sent via FCM
            FIRMessaging.messaging().remoteMessageDelegate = self
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            
        }
        
        UIApplication.shared.registerForRemoteNotifications()

        FIRApp.configure()
        /*
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            // For iOS 10 data message (sent via FCM
            FIRMessaging.messaging().remoteMessageDelegate = self
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)            }
        
        UIApplication.shared.registerForRemoteNotifications()
//        FIRApp.configure()
        
        fcm()
        
        */
    }
    //@NOtification
    func applicationReceivedRemoteMessage(_ remoteMessage: FIRMessagingRemoteMessage) {
                print(remoteMessage.appData)
    }
    //@ENd
    //    func fcm() { }
    func fcm() {
        guard let userID = UserDefaults.standard.value(forKey: "userId") as? Int else {
            UserDefaults.standard.setValue(nil, forKey: "FCMToken")
            print("⚠️No userID Found  ❌ ");
            return }
        
        guard  let refreshedToken = FIRInstanceID.instanceID().token() else {
            print("⚠️No Token Returned From FCM  ❌ ");
            return }
        print("☢️☣️InstanceID token: 📴📳\(refreshedToken)📴📳")
        
        if     UserDefaults.standard.value(forKey: "FCMToken") as? String != refreshedToken {
            print("✅Updating Token ✳️found  userId: \(String(describing: UserDefaults.standard.value(forKey: "userId") as? String))\n ,FCMToken \(String(describing: UserDefaults.standard.value(forKey: "FCMToken") as? String))\n, so updating it with refreshedToken \(refreshedToken)\n and userID : \(userID)")
            let parm : [String: Any ] = [
                "user_id": userID,
                "device_token": refreshedToken
            ]
            //            let userFCM = MUserData()
            Post_Requests().defaultPostRequest(postType: Connection.URLS_Post_Enum.register_device, parms: parm, completion: { (jData ) in
//                print(jData )
                                    UserDefaults.standard.setValue(refreshedToken, forKey: "FCMToken")
                                    print("✅Updated Token  ✅ ")

            }) { (err ) in
                
            }
            //            userFCM.userFCMToken(userID: userID, token: refreshedToken, completed: { (state,sms) in
            //
            //                if state {
            //                    UserDefaults.standard.setValue(refreshedToken, forKey: "FCMToken")
            //                    print("✅Updated Token  ✅ ")
            //
            //                }
            //            })
        }else {
            print("❌ Won't Update Token,it's Already in UserDefauls⚠️That's userId: \(String(describing: UserDefaults.standard.value(forKey: "userId") as? Int))\n ,♎️FCMTokenNSDefault  📴📳\(String(describing: UserDefaults.standard.value(forKey: "FCMToken") as? String)) 📴📳\n, ♎️updatedInstanceID token: 📴📳\(refreshedToken)📴📳\n")
        }
        
    }
    //    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    //        print(error.localizedDescription)
    //    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        print("that's the userInfo : \(userInfo)")
        print("that's the message Id  : \(String(describing: userInfo["gcm_message_id"]))")
        //        print("application.applicationState: \(application.applicationState)")
        //        if application.applicationState == .active {
        //            //write your code here when app is in foreground
        ////            print("User is in here")
        ////            if let title = userInfo["title"] as? String , let body = userInfo["body"] as? String {
        ////            showAlert( title , body)
        ////            }
        //        }
    }
    
    //@End Notification
    
    
    // With swizzling disabled you must set the APNs token here.
    // Messaging.messaging().apnsToken = deviceToken
}
