//
//  Login + RegisterationVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class Login___RegisterationVC: UIViewController {

    @IBOutlet weak var nameTxtF: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneTxtF: SkyFloatingLabelTextField!
    @IBOutlet weak var logoImg: UIImageView!
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
        guard let name = nameTxtF.text , name.count >= 3  , let mobileNum = phoneTxtF.text , mobileNum.count >= 10 else {
            
            self.view.showSimpleAlert("Something Wnet Wrong", "Please check your Data", .warning)
            return
        }
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "BodyMeasurementVC") as! BodyMeasurementVC
        vc.phoneNum = mobileNum
        vc.name = name
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    func animate() {
        let layer = logoImg.layer
        var rotationAndPerspectiveTransform : CATransform3D = CATransform3DIdentity
        rotationAndPerspectiveTransform.m34 = -1.0 / logoImg.bounds.width
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.85 * CGFloat(CGFloat.pi / 2), 0, 1, 0)
        
        var reverseRotation : CATransform3D = CATransform3DIdentity
        reverseRotation.m34 = -1.0 / logoImg.bounds.width
        reverseRotation = CATransform3DRotate(reverseRotation, 0.85 * CGFloat(CGFloat.pi / 2), 0, -1, 0)
        
        layer.transform = CATransform3DIdentity
        
        let time = 3.0
        UIView.animate(withDuration: time, animations: {
            layer.transform = rotationAndPerspectiveTransform
        },completion:{ finished in
            // *               UIView.animate(withDuration: 0.2, animations: {
            // *                   layer.transform = CATransform3DIdentity
            //  *              },completion:{finished in
            
            UIView.animate(withDuration: time, animations: {
                layer.transform = reverseRotation
            },completion:{ finished in
                UIView.animate(withDuration: time, animations: {
                    layer.transform = CATransform3DIdentity
                },completion: { finished in
//                    self.animate()
                })
            })
        })
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
