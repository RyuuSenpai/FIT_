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
    
    func setupSocialLoginRequestResponse(_ rData : Profile_Details_M) {
        guard !rData.has_measurement  else  {
            ad.saveUserLogginData(mobileNum: "", uid: rData.id, name: rData.fullName)
            //                self.dismissKeyboard()
            ad.reloadWithAnimationToHome()
            ad.killLoading()
            return
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BodyMeasureVC") as! BodyMeasureVC //BodyMeasureVC()
        self.present(vc, animated: true, completion: nil)
        ad.killLoading()
    }
}

//
//  MyExtensions.swift
//  Hyper
//
//  Created by admin on 3/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage


extension Notification.Name {
    static let OnMainPage = Notification.Name("OnMainPage")
    static let OnDashBoardVC = Notification.Name("OnDashBoardVC")
    static let OnAddFriendsVC = Notification.Name("OnAddFriendsVC")
    static let OnGoogleMapsVC = Notification.Name("OnGoogleMapsVC")
    static let OnConversationViewController = Notification.Name("OnConversationViewController")
    static let OnNewsDetailsViewController = Notification.Name("OnNewsDetailsViewController")
    static let AttendeesListVC = Notification.Name("AttendeesListVC")
    static let PickAssistantVC = Notification.Name("PickAssistantVC")
    
    
}


extension String {
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}

extension UIImage{
    var roundedImage: UIImage {
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
            ).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func roundedWithBorder(width: CGFloat, color: UIColor) -> UIImage? {
        let square = CGSize(width: width,height:width)
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = color.cgColor
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func imageResize (sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }
    
    
    func resize(maxWidthHeight : Double)-> UIImage? {
        
        let actualHeight = Double(size.height)
        let actualWidth = Double(size.width)
        var maxWidth = 0.0
        var maxHeight = 0.0
        
        if actualWidth > actualHeight {
            maxWidth = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }else{
            maxHeight = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualHeight)
            maxWidth = (actualWidth * per) / 100.0
        }
        
        let hasAlpha = true
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
extension UIImageView {
    
    func setupApiImage(imagePath : String) {
        guard let url = URL(string: imagePath ) else { return }
        self.af_setImage(
            withURL: url ,
            placeholderImage: UIImage(named: "Splash"),
            filter: nil,
            imageTransition: .crossDissolve(0.2)
        )
    }
    
    func setupApiImage(imagePath : String,placeHolderImg: UIImage) {
        guard let url = URL(string: imagePath ) else { return }
        self.af_setImage(
            withURL: url ,
            placeholderImage: placeHolderImg,
            filter: nil,
            imageTransition: .crossDissolve(0.2)
        )
    }
}
extension UILabel {
    
    func strikeIt(text : String)  {
        let attributeString = NSAttributedString(string: text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue])
        self.attributedText = attributeString
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
        alert.autoHideTime = 3
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
        alert.autoHideTime = 3
        
        alert.show()
        
    }
    
    
    func emptyTextFieldHandler(_ textF : UITextField,_ title : String,_ sms : String?,_ alertTyper : CDAlertViewType) {
        self.showAlert(title, sms, alertTyper, {
            
            //            textF.becomeFirstResponder()
        })
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UIColor {
    public class  var defaultPurple : UIColor {
        return UIColor(rgb: 0xa32389) //57AD57
    }
    public class  var deafultOrange : UIColor {
        return UIColor(rgb: 0xff8c25) //57AD57
    }
    public class  var subTExtGray : UIColor {
        return UIColor(rgb: 0x6b6b6b)
    }
    public class  var infoTExtGray : UIColor {
        return UIColor(rgb: 0xb8b8b8)
    }
    public class  var deafultRed : UIColor {
        return UIColor(rgb: 0xe9595f)
    }
    public class  var deafultGreen : UIColor {
        return UIColor(rgb: 0x3bcd9f)
    }
}
extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            
            self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom + 70)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset , animated: true)
        }
    }
    
}


extension UICollectionView {
    func animateCells( ) {
        self.reloadData()
        let cells = self.visibleCells
        //        let tableHeight = tableView.bounds.size.height
        //        let tableWidth = tableView.bounds.size.width
        
        for i in cells {
            let cell = i as UICollectionViewCell
            cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.1).concatenating(CGAffineTransform(translationX: -800, y:0))
        }
        var index = 0
        
        for a in cells {
            let cell = a as UICollectionViewCell
            UIView.animate(withDuration: 1.4, delay: 0.05 * Double(index), usingSpringWithDamping: 0.73, initialSpringVelocity: 0, options: [.curveEaseOut,.allowUserInteraction], animations: {
                cell.transform = .identity
            })
            index += 1
        }
    }
}

extension UITableView {
    func animateCells( ) {
        self.reloadData()
        let cells = self.visibleCells
        //        let tableHeight = tableView.bounds.size.height
        //        let tableWidth = tableView.bounds.size.width
        
        for i in cells {
            let cell = i as UITableViewCell
            cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.1).concatenating(CGAffineTransform(translationX: -800, y:0))
        }
        var index = 0
        
        for a in cells {
            let cell = a as UITableViewCell
            UIView.animate(withDuration: 1.4, delay: 0.05 * Double(index), usingSpringWithDamping: 0.73, initialSpringVelocity: 0, options: [.curveEaseOut,.allowUserInteraction], animations: {
                cell.transform = .identity
            })
            index += 1
        }
    }
}



extension String {
    
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    //validate Password
    var isValidPassword: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z_0-9\\-_,;.:#+*?=!§$%&/()@]+$", options: .caseInsensitive)
            if(regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil){
                
                if(self.count>=8 && self.count<=20){
                    return true
                }else{
                    return false
                }
            }else{
                return false
            }
        } catch {
            return false
        }
    }
    var ispriceValue : Bool {
        
        let characterset = CharacterSet(charactersIn: "1234567890٠١٢٣٤٥٦٧٨٩")
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            //          ////print("string contains special characters")
            return false
        }else {
            return true
        }
    }
    //let pattern = "^(009665|9665|\\+9665|05|5)?(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
    //    func validate(value: String) -> Bool {
    //        let PHONE_REGEX = "^(009665|9665|\\+9665|05|5)?(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
    //        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    //        let result =  phoneTest.evaluate(with: value)
    //        return result
    //    }
    
    var validPhoneNumber : Bool  {
        //      ////print("that is the phone : \(self)")
        let PHONE_REGEX = "^(05|9665)?(5|0|3|6|4|9|1|8|7)([0-9]{7})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        //      ////print("that is the phone result : \(result)")
        return result
        
    }
    /*
     انا دخلت
     0 5 0 1 4 7 2 5 8 1
     0511853257
     0 5 1 1 2 3 4 5 6 7
     مدخلشى
     */
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    //To check text field or String is blank or not
    var isBlankOrLessThan3chr: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            guard trimmed.isEmpty , self.characters.count <= 4 else {
                
                return false
            }
            return trimmed.isEmpty
        }
    }
    func isBlankOrLessThan(_ num : Int) -> Bool{
        let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
        guard trimmed.isEmpty , self.characters.count <= num else {
            
            return false
        }
        return  true
    }
    
    
    
}


