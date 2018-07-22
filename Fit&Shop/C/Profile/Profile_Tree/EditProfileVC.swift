//
//  EditProfileVC.swift
//  Fit&Shop
//
//  Created by Killva on 7/15/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
class EditProfileVC: UIViewController {
    
    @IBOutlet weak var fullNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumTF: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTF: SkyFloatingLabelTextField!
    @IBOutlet weak var oldPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var newPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var stackView: UIStackView!
    
    var parm = [String : Any]()
    var data : Profile_Details_M?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupdata()
    }
    
    func setupdata() {
        guard let data = data else { return }
        self.fullNameTF.text = data.first_name
        self.phoneNumTF.text = data.mobile
        self.emailTF.text = data.email
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        if   !Constant.isNormalLogin {
            stackView.removeArrangedSubview(oldPassTF)
            stackView.removeArrangedSubview(newPassTF)
            stackView.removeArrangedSubview(confirmPassTF)
            
            oldPassTF.alpha = 0
            newPassTF.alpha = 0
            confirmPassTF.alpha = 0

        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sendData() {
        
        
    }
    
    func validateProfileEdit(){
        guard  let fullName = fullNameTF.text , fullName.count >= 3  || fullNameTF.text == ""  else {
            fullNameTF.errorMessage = "Invalid First Name"
            fullNameTF.becomeFirstResponder()
            return
        }
        parm["first_name"] = fullName
        parm["user_id"] = ad.getUserID()
        
        fullNameTF.errorColor = .green
        //        guard let lastN = lastNameTxtF.text ,lastN.count >= 3  else {
        //            lastNameTxtF.errorMessage = "Invalid Last Name"
        //            lastNameTxtF.becomeFirstResponder()
        //            return
        //        }
        //        lastNameTxtF.errorColor = .green
        guard let email = emailTF.text ,email.isEmail || emailTF.text == "" else {
            emailTF.errorMessage = "Invalid Email Format"
            emailTF.becomeFirstResponder()
            return
        }
        parm["email"] = email
        
        emailTF.errorColor = .green
        
        guard   let mobileNum = phoneNumTF.text , mobileNum.count >= 10  || phoneNumTF.text == ""  else {
            phoneNumTF.errorMessage = "Invalid Mobile Number"
            phoneNumTF.becomeFirstResponder()
            return
        }
        phoneNumTF.errorColor = .green
        parm["mobile"] = mobileNum
        
        guard  self.passwordValidation() else { return }
        
        ad.isLoading()
        Post_Requests().social_Login(postType: .edit_profile, parms: parm, completion: {[weak self] (rData ) in
            
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
                ad.killLoading()
            }
            
        }) { (err ) in
            self.showApiErrorSms(err: err )
            ad.killLoading()
        }
    }
    
    func passwordValidation() -> Bool {
        
        guard oldPassTF.text != "" else { return true }
        guard  let oldPass  = oldPassTF.text ,oldPass.isValidPassword  else {
            oldPassTF.errorMessage = "Invalid Old Password"
            oldPassTF.becomeFirstResponder()
            return false
        }
        guard  let newPass  = newPassTF.text ,newPass.isValidPassword  else {
            newPassTF.errorMessage = "Invalid New Password"
            newPassTF.becomeFirstResponder()
            return false
        }
        guard  let confPass  = confirmPassTF.text  , newPass == confPass else {
            confirmPassTF.errorMessage = "Password doesn't match"
            confirmPassTF.becomeFirstResponder()
            return false
        }
        parm["password"] = newPass
        
        return true
    }
    
    
    
    @IBAction func editProfileHandler(_ sender: UIButton) {
        validateProfileEdit()
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
