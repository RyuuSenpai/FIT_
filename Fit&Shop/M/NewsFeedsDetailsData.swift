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
    
 
    private  var _title : String!
    private  var _body : String!
    private  var _image : String!
    private  var _message : String!

    var title : String { return _title }
    var body : String { return _body }
    var image : String { return "http://arafa.000webhostapp.com/FitAndShop/uploads/" + _image }
    var message : String { return _message }

 
    init(json : JSON ) {
        
        self._title = json["title"].stringValue
        self._body = json["body"].stringValue
        self._image = json["image"].stringValue
        self._message = json["message"].stringValue

 
    }
}
