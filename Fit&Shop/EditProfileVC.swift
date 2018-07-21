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
    @IBOutlet weak var oldPassTF: SkysFloatingLabelTextField!
    @IBOutlet weak var newPassTF: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPassTF: SkyFloatingLabelTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sendData() {
        
        let parm : [String : Any] = [
            "old_password": "string",
            "user_id": ad.getUserID() ,
            "email": "string",
            "last_name": "string",
            "first_name": "string",
            "password": "string",
            "mobile" : ""
            ]
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
