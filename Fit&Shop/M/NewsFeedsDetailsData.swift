//
//  NewsDetails.swift
//  Fit&Shop
//
//  Created by Killva on 7/21/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsFeedsDetailsData {
    
    private  var _title_ar : String!
    private  var _body_ar : String!
    private  var _title : String!
    private  var _body : String!
    private  var _image : String!
    private  var _message : String!

    var title : String {
        if _title_ar == "" {
            _title_ar = _title
        }
        return L102Language.currentAppleLanguage() == "ar" ? _title_ar : _title
    }
    var body : String {
        if _body_ar == "" {
            _body_ar = _body
        }
        return L102Language.currentAppleLanguage() == "ar" ? _body_ar : _body
    }
    var image : String { return "http://arafa.000webhostapp.com/FitAndShop/uploads/" + _image }
    var message : String { return _message }

 
    init(json : JSON ) {
        self._title_ar = json["title_ar"].stringValue
        self._body_ar = json["body_ar"].stringValue

        self._title = json["title"].stringValue
        self._body = json["body"].stringValue
        self._image = json["image"].stringValue
        self._message = json["message"].stringValue

 
    }
}
