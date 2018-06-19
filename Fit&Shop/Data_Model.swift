//
//  Data_Model.swift
//  Fit&Shop
//
//  Created by Killva on 5/8/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import Foundation
import SwiftyJSON


class Brands_DataModel {
    
    
   private  var _brand : String!
   private  var _brand_id : Int!
    private var _fittedClothesData : [Piece_Data] = []

    var brandName : String { return _brand }
    var brandID : Int { return _brand_id}
    
    var fittedClothesData : [Piece_Data] { return _fittedClothesData }
   
    init(json : JSON ) {
        
        self._brand = json["brand_name"].stringValue
        self._brand_id = json["brand_id"].intValue

        for x in json["fitted"] {
            let data = Piece_Data(json: x.1)
            _fittedClothesData.append(data)
            
        }
     }
    
}

class Piece_Data {
    
    private var _sizes : [FittedClothesData] = []

    private  var _piece_name : String!
    private  var _piece_id : Int!
    
    var piece_name : String { return _piece_name }
    var piece_id : Int { return _piece_id }
    
    var sizes : [FittedClothesData] { return _sizes }

    init(json : JSON ) {
        
        self._piece_name = json["piece_name"].stringValue
        self._piece_id = json["piece_id"].intValue
        
        for x in json["sizes"] {
            let data = FittedClothesData(json: x.1)
            _sizes.append(data)
            
        }
        
    }
}

class  FittedClothesData {
    
   private var _chest : Double!
   private     var _hips : Double!
      private  var _length : Double!
      private  var _piece : String!
     private   var _piece_id : Int!
      private  var _size : String!
     private   var _size_id : Int!
     private   var _waist : Double!
    private var _desc : String!
    private   var _id : Int!

    var desc : String { return _desc }
    var chest : Double { return _chest }
    var hips : Double { return _hips}
    var length : Double { return _length}
    var piece : String { return _piece}
    var piece_id : Int{ return _piece_id}
    var size : String{ return _size}
    var size_id : Int{ return _size_id}
    var waist : Double{ return _waist}
    
    var id : Int { return _id}

    
    
    init(json : JSON) {
        self._desc = json["desc"].stringValue
        self._chest = json["chest"].doubleValue
        self._hips = json["hips"].doubleValue
        self._length = json["length"].doubleValue
        self._piece = json["piece"].stringValue
        self._piece_id = json["piece_id"].intValue
        self._size = json["size"].stringValue
        self._size_id = json["size_id"].intValue
        self._waist = json["waist"].doubleValue
        self._id = json["id"].intValue
    }
 
}





class Profile_Details_M {
    private var _birthday : String!
    private var _email : String!
    private var _fav_lan : String!
    private var _fb_token : String!
    private var _first_name : String!
    private var _gender : String!
    private var _google_id : String!
    private var _last_name : String!
    private var _latitude : String!
    private var _longitude : String!
    private var _has_measurement : Int!
    private var _date_add : String!
    private var _date_upd : String!
    private var _id : Int!
    
    private var _image : String!
    private var _quantity : Int!
    private var _active : Int!
    
    var active  : Bool {
        return  _active == 1
    }
    var birthday : String {return _birthday }
    
    var date_add : String {return _date_add }
    var date_upd : String {return _date_upd }
    var  id : Int {return _id }
    var has_measurement : Bool { return _has_measurement == 0 ? false : true }
    var email : String {return _email }
    var fav_lan : String {return _fav_lan }
    var fb_token : String {return _fb_token }
    var first_name : String {return _first_name }
    var gender : String {return _gender }
    var google_id : String {return _google_id }
    var last_name : String {return _last_name }
    var latitude : String {return _latitude }
    var longitude : String {return _longitude }
    
    var fullName : String { return "\(first_name) \(last_name)"}
    var image : String {
        return  Constant.images_Url +   _image
    }
    init(_ jsonData : JSON) {
        self._active = jsonData[Constant.parameters.active].intValue
        self._birthday = jsonData[Constant.parameters.birthday].stringValue
        self._email = jsonData[Constant.parameters.email].stringValue
        self._fav_lan = jsonData[Constant.parameters.fav_lan].stringValue
        self._fb_token = jsonData[Constant.parameters.fb_token].stringValue
        self._first_name = jsonData[Constant.parameters.first_name].stringValue
        self._gender = jsonData[Constant.parameters.gender].stringValue
        self._google_id = jsonData[Constant.parameters.google_id].stringValue
        self._last_name = jsonData[Constant.parameters.last_name].stringValue
        self._latitude = jsonData[Constant.parameters.latitude].stringValue
        self._longitude = jsonData[Constant.parameters.longitude].stringValue
        
        self._date_add = jsonData[Constant.parameters.date_add].stringValue
        self._date_upd = jsonData[Constant.parameters.date_upd].stringValue
        self._id = jsonData[Constant.parameters.id].intValue
        self._has_measurement = jsonData["has_measurement"].intValue
        let img =  jsonData[Constant.parameters.image_url].stringValue
        if img != "" {
            self._image = img
        }else if   jsonData["profile_pic"].stringValue != "" {
            self._image =  jsonData["profile_pic"].stringValue
        }else if let img = UserDefaults.standard.value(forKey: "profileImage") as? String {
            self._image = img
        }else {
            self._image = ""
        }
        
        
    }
    
    
}
