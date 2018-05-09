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
    
    var brandName : String { return _brand }
    var brandID : Int { return _brand_id}
    private var _fittedClothesData : [FittedClothesData] = []
    
    var fittedClothesData : [FittedClothesData] { return _fittedClothesData }
    init(json : JSON ) {
        
        self._brand = json["brand"].stringValue
        self._brand_id = json["brand_id"].intValue

        for x in json["fitted"] {
            _fittedClothesData.append(FittedClothesData(json: x.1))
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
    
    var desc : String { return _desc }
    var chest : Double { return _chest }
    var hips : Double { return _hips}
    var length : Double { return _length}
    var piece : String { return _piece}
    var piece_id : Int{ return _piece_id}
    var size : String{ return _size}
    var size_id : Int{ return _size_id}
    var waist : Double{ return _waist}
    
    
    
    
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

    }
 
}
