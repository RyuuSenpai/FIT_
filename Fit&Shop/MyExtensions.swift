//
//  MyExtensions.swift
//  Hyper
//
//  Created by admin on 3/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    func hideKeyboardWhenTapped() {
        
        let tap  = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
    
    
}

import CDAlertView
extension UIView {
    func showAlert(_ title : String? , _ sms : String? ,_ alertType : CDAlertViewType ,_ action:( ()->())?) {
        
        
        let alert = CDAlertView(title: title, message: sms, type: alertType)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 90 ) / 180 )
            alpha = 0
            action?()
        }
        alert.hideAnimationDuration = 0.55
        alert.show()
    }
    
    func showSimpleAlert(_ title : String? , _ sms : String? ,_ alertType : CDAlertViewType ) {
        
        let smsR = sms
        let alert = CDAlertView(title: title, message: smsR, type: alertType)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 90 ) / 180 )
            alpha = 0
        }
        alert.hideAnimationDuration = 0.55
        alert.show()
    }
    
    func emptyTextFieldHandler(_ textF : UITextField,_ title : String,_ sms : String?,_ alertTyper : CDAlertViewType) {
        self.showAlert(title, sms, alertTyper, {
            
            //            textF.becomeFirstResponder()
        })
    }
}
