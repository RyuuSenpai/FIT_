//
//  UIView+Border.swift
//  Benefactor
//
//  Created by MacBook Pro on 12/31/16.
//  Copyright © 2016 Old Warriors. All rights reserved.
//

import UIKit


let FONT_NAME = "NeoSansArabic" //L102Language.currentAppleLanguage() == "ar" ? "GE_SS_Two_Light": "GOTHICI"
let BOLD_FONT_NAME = "NeoSansArabic-Bold"  //L102Language.currentAppleLanguage() == "ar" ? "GE_SS_Two_Bold": "GOTHICB"
let EXTRA_FONT_NAME = FONT_NAME//  L102Language.currentAppleLanguage() == "ar" ? "GE_SS_Two_Medium": "GOTHICBI"


struct AppFontName {
    static let regular = "NeoSansArabic"
    static let bold = "NeoSansArabic-Bold"
    static let italic = "NeoSansArabic-ItalicMT"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
//extension UILabel {
//    func customizeFont()
//    {
//        let fontSize =   self.font.pointSize
//        self.font = UIFont(name: FONT_NAME, size: fontSize)
//    }
//    func customizeBoldFont()
//    {
//        let fontSize =   self.font.pointSize
//
//        self.font = UIFont(name: BOLD_FONT_NAME, size: fontSize)
//    }
//    func customizezMediumFont()
//    {
//        let fontSize =   self.font.pointSize
//        self.font = UIFont(name: EXTRA_FONT_NAME, size: fontSize)
//    }
//
//}
//
//extension UITextField {
//    func customizeFont()
//    {
//        self.font = UIFont(name: FONT_NAME, size: (self.font?.pointSize)!)
//
//    }
//    func customizePlaceHolder(_ color:UIColor)
//    {
//        if let txt1  = self.placeholder
//        {
//            let attributed = NSAttributedString(string: txt1, attributes: [NSAttributedStringKey.foregroundColor : color,NSAttributedStringKey.font:self.font!])
//            self.attributedPlaceholder = attributed
//
//        }
//
//    }
//}
//extension UITextView {
//    func customizeFont()
//    {
//        self.font = UIFont(name: FONT_NAME, size: (self.font?.pointSize)!)
//
//    }
//    func customizePlaceHolder(_ color:UIColor)
//    {
//        if let txt1  = self.placeholder
//        {
//            let attributed = NSAttributedString(string: txt1, attributes: [NSAttributedStringKey.foregroundColor : color,NSAttributedStringKey.font:self.font!])
//            self.attributedPlaceholder = attributed
//
//        }
//
//    }
//}


