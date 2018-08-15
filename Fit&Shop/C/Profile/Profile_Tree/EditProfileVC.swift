//
//  EditProfileVC.swift
//  Fit&Shop
//
//  Created by Killva on 7/15/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import AlamofireImage
import Alamofire
import MobileCoreServices
import AVFoundation

protocol UpdatedProfilePic: class {
    func hasUpdatedProfileImg(img : UIImage)
}

class EditProfileVC: UIViewController  {
    
    @IBOutlet weak var fullNameTF: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumTF: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTF: SkyFloatingLabelTextField!
    @IBOutlet weak var oldPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var newPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var profileImage: UIImageViewX!

    

    weak var delegate : UpdatedProfilePic?
    var parm = [String : Any]()
    var data : Profile_Details_M?
    var pImage : UIImage?
    var oldProfileImage : UIImage?
    fileprivate let picker = UIImagePickerController()
    fileprivate var imageDict : [String:Any] = [:]
    var didChangeProfileImg = false

//   @objc  private func updateImage() {
//    ad.isLoading()
//    print(pImage)
//        Post_Requests().editImage_requestURl(image: pImage, success: { [weak self] (sucess ) in
//
//            DispatchQueue.main.async {
//                ad.killLoading()
//                self?.delegate?.hasUpdatedProfileImg(img: self?.pImage ??  UIImage(named:"ic_profile_pic_")!)
//            }
//
//        }) { (err ) in
//
//            self.showApiErrorSms(err: err)
//        }
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupdata()
 
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
        picker.delegate = self

        loclizeData()
    }
    
    
    func loclizeData() {
        
        self.fullNameTF.placeholder = L0S.Name.stringValue()
        self.phoneNumTF.placeholder = L0S.Phone_number.stringValue()
        self.emailTF.placeholder = L0S.E_mail.stringValue()
        self.oldPassTF.placeholder = L0S.Old_Password.stringValue()
        self.newPassTF.placeholder = L0S.New_Password.stringValue()
        self.confirmPassTF.placeholder = L0S.Confirm_New_Password.stringValue()
        
        self.fullNameTF.selectedTitle = L0S.Name.stringValue()
        self.phoneNumTF.selectedTitle = L0S.Phone_number.stringValue()
        self.emailTF.selectedTitle = L0S.E_mail.stringValue()
        self.oldPassTF.selectedTitle = L0S.Old_Password.stringValue()
        self.newPassTF.selectedTitle = L0S.New_Password.stringValue()
        self.confirmPassTF.selectedTitle = L0S.Confirm_New_Password.stringValue()
    }
    
    
    func setupdata() {
        guard let data = data else { return }
        self.fullNameTF.text = data.first_name
        self.phoneNumTF.text = data.mobile
        self.emailTF.text = data.email
        print(data.image)
        self.profileImage.setupApiImage(imagePath: data.image, placeHolderImg: UIImage(named:"ic_profile_pic_")! )
        print("✅", data.image)
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



extension EditProfileVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate    {
    //https://makeapppie.com/2016/06/28/how-to-use-uiimagepickercontroller-for-a-camera-and-photo-library-in-swift-3-0/
    //        @IBOutlet weak var myImageView: UIImageView!
    
    @objc func imageTapped()
    {
        //        photoFromLibrary()
        //        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let actionSheet :UIAlertController = UIAlertController(title: " ",  message: L0A.Select_your_image_from_.stringValue() , preferredStyle: .actionSheet
            
        )
        let cancle:UIAlertAction = UIAlertAction(title: L0A.Cancel.stringValue(), style: .cancel, handler: nil)
        let photos :UIAlertAction = UIAlertAction(title: L0A.Photos_Gallery.stringValue(), style: .default) { UIAlertAction in
            
            self.photoFromLibrary()
        }
        let camera :UIAlertAction = UIAlertAction(title: L0A.Camera.stringValue(), style: .default) { UIAlertAction in
            
            
            self.shootPhoto()
            
            
        }
        actionSheet.addAction(photos)
        
        actionSheet.addAction(camera)
        
        actionSheet.addAction(cancle)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
    func photoFromLibrary() {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
        
    }
    
    func shootPhoto() {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { [weak self ](granted :Bool) -> Void in
            if granted == true
            {
                // User granted
                DispatchQueue.main.async {
                    self?.userCamera()
                }
            }
            else
            {
                DispatchQueue.main.async {
                    self?.view.showSimpleAlert("", L0A.Allow_Camera_Access_will_relaunch_the_app.stringValue(), .warning)
                    let alert = UIAlertController(title: "" , message: L0A.This_app_isnot_authorized_to_use_Camera.stringValue(), preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: L0A.Setting.stringValue(), style: .default, handler: { (_) in
                        if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
                            UIApplication.shared.openURL(settingsURL)
                        }
                        
                    }))
                    alert.addAction(UIAlertAction(title: L0A.Cancel.stringValue(), style: .cancel, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
                return
            }
        });
        
        
    }
    
    func userCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            //            picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
            picker.mediaTypes = [kUTTypeImage as String]
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: L0A.No_Camera.stringValue(),
            message: L0A.Sorry_This_Device_Has_No_Camera.stringValue(),
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        ad.isLoading()
        var  chosenImage = UIImage()
        
        
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            chosenImage = image
        }else   if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            chosenImage = image //2
        }
        profileImage.contentMode = .scaleAspectFill //3
        //        self.oldProfileImage = profileImage.image
        profileImage.image = chosenImage //4
        let myThumb  = chosenImage.resizeImageWith(newSize: CGSize(width: 200, height: 200))
        //        let image = myThumb
        //        if let data = UIImageJPEGRepresentation(image, 1.0) {
        //            print("Size: \(data.count ) bytes")
        //        }
        imageDict["ProfileImage"] = myThumb
        
        Post_Image_Requests().postProfileUpdate(parameters: [:], image: myThumb, completed:  { [weak self ] (img ) in
            
            DispatchQueue.main.async {
                ad.killLoading()
                self?.didChangeProfileImg = true
                self?.view.showSimpleAlert("Sucess", "", .success)
                self?.delegate?.hasUpdatedProfileImg(img: self?.pImage ??  UIImage(named:"ic_profile_pic_")!)

                //                self?.profileImage.setupApiImage(imagePath: img)
                
            }
        }) {
            DispatchQueue.main.async {
                ad.killLoading()
                self.profileImage.image = self.oldProfileImage
//                self.view.showSimpleAlert(L0A.netWorkError.stringValue(), "", .error)
                self.view.showSimpleAlert("Network Error", "", .error )
            }
        }
        //        Post_Image_Requests().postProfileUpdate(parameters: [:], imageDict:  myThumb, completed: <#(String) -> ()#>) {[weak self] (state, sms) in
        //            guard state else {
        //                DispatchQueue.main.async {
        //                    self?.profileImage.image = self?.oldProfileImage
        //                    ad.killLoading()
        //                    self?.view.showSimpleAlert("", sms, .error)
        //                }
        //                return
        //            }
        //            DispatchQueue.main.async {
        //                self?.profileImage.image = chosenImage
        //                ad.killLoading()
        //                self?.view.showSimpleAlert(L0A.Success.stringValue(), "", .success)
        //            }
        //        }
        dismiss(animated:true, completion: nil) //5
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func sendUserChangeStatus(){
        let state = false
        
        
    }
    
}
