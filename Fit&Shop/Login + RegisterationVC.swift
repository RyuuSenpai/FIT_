//
//  Login + RegisterationVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

import FBSDKLoginKit
import GoogleSignIn
import Google


class Login___RegisterationVC: UIViewController , GIDSignInDelegate,GIDSignInUIDelegate {

    @IBOutlet weak var emailTxtF: SkyFloatingLabelTextField!
    @IBOutlet weak var passTxtF: SkyFloatingLabelTextField!
//    @IBOutlet weak var logoImg: UIImageView!
    let postRequest = Post_Requests()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnhandler(_ sender: UIButton) {
        guard let email = emailTxtF.text , email.count >= 3  , let pass = passTxtF.text , pass.count >= 4 else {
            
            self.view.showSimpleAlert("Something Wnet Wrong", "Please check your Data", .warning)
            return
        }
        
        let parm = [
             "password": pass,
            "email": email
         ]
        
        ad.isLoading()
        
        Post_Requests().social_Login(postType: .login_User, parms: parm, completion: {  (rData ) in
            
            DispatchQueue.main.async {
                //                ad.saveUserLogginData(email: rData.email , photoUrl:nil, uid: rData.id, name: rData.fullName)
                
                ad.saveUserLogginData(mobileNum: "", uid: rData.id, name: rData.fullName)
                //                self.dismissKeyboard()
                ad.reloadWithAnimationToHome()
                ad.killLoading()
                
            }
        }) { (err ) in
            //            self.showApiErrorSms(err: err )
            ad.killLoading()
        }
        
        
//        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "BodyMeasurementVC") as! BodyMeasurementVC
//        vc.phoneNum = mobileNum
//        vc.name = name
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }

    
    @IBAction func signupBtnHandler(_ sender: UIButton) {
        
        let vc = RegisterVC()
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BodyMeasureVC" ) as! BodyMeasureVC
        self.present(vc, animated: true, completion: nil)
    }
    //    func animate() {
//        let layer = logoImg.layer
//        var rotationAndPerspectiveTransform : CATransform3D = CATransform3DIdentity
//        rotationAndPerspectiveTransform.m34 = -1.0 / logoImg.bounds.width
//        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.85 * CGFloat(CGFloat.pi / 2), 0, 1, 0)
//
//        var reverseRotation : CATransform3D = CATransform3DIdentity
//        reverseRotation.m34 = -1.0 / logoImg.bounds.width
//        reverseRotation = CATransform3DRotate(reverseRotation, 0.85 * CGFloat(CGFloat.pi / 2), 0, -1, 0)
//
//        layer.transform = CATransform3DIdentity
//
//        let time = 3.0
//        UIView.animate(withDuration: time, animations: {
//            layer.transform = rotationAndPerspectiveTransform
//        },completion:{ finished in
//            // *               UIView.animate(withDuration: 0.2, animations: {
//            // *                   layer.transform = CATransform3DIdentity
//            //  *              },completion:{finished in
//
//            UIView.animate(withDuration: time, animations: {
//                layer.transform = reverseRotation
//            },completion:{ finished in
//                UIView.animate(withDuration: time, animations: {
//                    layer.transform = CATransform3DIdentity
//                },completion: { finished in
////                    self.animate()
//                })
//            })
//        })
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func facebookHandler(_ sender: UIButton) {
        //        let vc = CustomSplashScreen()
        //        self.present(vc, animated: true, completion: nil)
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logOut()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if((fbloginresult.grantedPermissions) != nil) {
                    self.getFBUserData()
                }
                else if (fbloginresult.isCancelled) {
                    
                }
            }
            else {
                //                print(error)
            }
        }
    }
    
    @IBAction func googleHandler(_ sender: UIButton) {
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self;
        GIDSignIn.sharedInstance().signIn()
        
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        
        viewController.dismiss(animated: true, completion: nil)
        //NotificationCenter.default.post(name: .closeLoginVC, object: nil)
        
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        ad.isLoading()
        
        if (user != nil) {
            let userId = user.userID as String                // For client-side use only!
            //let idToken = user.authentication.idToken as String // Safe to send to the server
            let fullName = user.profile.name as String
            let givenName = user.profile.givenName as String
            let familyName = user.profile.familyName as String
            let email = user.profile.email as String
            let img = user.profile.imageURL(withDimension: 200)
            var userDict = Dictionary<String,String>()
            userDict["google_id"] = userId
            userDict["first_name"] = givenName
            userDict["email"] = email
            userDict["last_name"] = familyName
            userDict["access_token"] = user.authentication.accessToken
            userDict["picture"] =  img?.absoluteString
            //            print(userDict)
            
            ad.isLoading()
            
            self.postRequest.social_Login(postType: .google_Login, parms: userDict , completion: { (rData) in
                
                ad.saveUserLogginData(email: rData.email , photoUrl: userDict["picture"], uid: rData.id, name: rData.fullName)
                ad.reloadWithAnimationToHome()
            }, failure: { (err ) in
                print(err)
                self.showApiErrorSms(err: err )
            })
            
        }
        else {
            ad.killLoading()
            //self.showAlert(message: "Something went wrong, Please try again later.")
        }
    }
    
    //to be deleted
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email "]).start(completionHandler: { [ weak self] (connection, result, error) -> Void in
                
                if (error == nil) {
                    if let resultDict = result as? [String: AnyObject] {
                        var userDict = Dictionary<String,String>()
                        
                        guard let email = resultDict["email"] as? String, let id = resultDict["id"] as? String , let firstName = resultDict["first_name"] as? String, let lastname = resultDict["last_name"] as? String  else {
                            
                            return
                        }
                        
                        userDict["fb_id"] =  id
                        userDict["first_name"] = firstName
                        userDict["email"] = email
                        userDict["last_name"] = lastname
                        userDict["fb_token"] = FBSDKAccessToken.current().tokenString
                        if let imageURL = ((resultDict["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                            //Download image from imageURL
                            //                            print(imageURL)
                            userDict["picture"] = imageURL
                        }
                        //                            {
                        //                                 "birthday": "string",
                        //                                "picture": "string",
                        //                                "gender": "string",
                        //                          }
                        print(userDict)
                        
                        DispatchQueue.main.async {
                            ad.isLoading()
                        }
                        
                        self?.postRequest.social_Login(postType: .fB_Login, parms: userDict , completion: { (rData) in
                            
                            //                            print(rData)
                            ad.saveUserLogginData(email: rData.email , photoUrl: userDict["picture"], uid: rData.id, name: rData.fullName)
                            ad.reloadWithAnimationToHome()
                        }, failure: { (err ) in
                            self?.showApiErrorSms(err: err )
                        })
                        
                        
                    }
                    
                    //print("\n\n\nToken is \(FBSDKAccessToken.current().tokenString)")
                    
                    
                }
                else {
                    //self.showAlert(message: "Something went wrong, Please try again later.")
                }
            })
        }
    }
}
