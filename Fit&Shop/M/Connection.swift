//
//  Connection.swift
//  Pizza
//
//  Created by MacBook Pro on 1/3/17.
//  Copyright © 2017 Old Warriors. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

// on success request
public typealias ConnectionSuccess = (_ object:JSON) -> Void
// on failed request
public typealias ConnectionFailed = (_ error:Error?) -> Void

class Connection: NSObject {
    
     
 
    enum URLS_Post_Enum {
        case saveMeauseData
        case get_user_measurment_by_id
        case signup_User
        case login_User
        case google_Login
        case fB_Login
        case edit_profile
        case register_device
        case edit_Image
        func stringValue() -> String {
             switch self {
             case .login_User :
                return Constant.main_url + "User/user_login"
            case .saveMeauseData:
                return Constant.main_url  + "General/register_entry"
                
             case .get_user_measurment_by_id:
                return Constant.main_url  + "General/get_user_measurement_by_id"
             case .signup_User:
                    return Constant.main_url  + "User/user_signup"
             case .google_Login:
                return Constant.main_url  + "User/google_login"
              case .fB_Login:
                return Constant.main_url  + "User/facebook_login"
             case .edit_profile :
                return Constant.main_url + "User/edit_profile"
             case .register_device :
                return Constant.main_url + "User/register_device"
             case .edit_Image :
                return Constant.main_url + "User/edit_user_image?UserID=\(ad.getUserID())"
            }
        }
    }
    
    enum URLS_Get_Enum {
        case Profile_Data
        case New_Feeds

        func stringValue() -> String {
            switch self {
            case .Profile_Data: return Constant.main_url + "User/get_user_details_by_id?UserID="
            case .New_Feeds : return Constant.main_url + "General/get_news_feed"
            }
        }
    }
    //get
    
    class public func performGet(urlString:String,success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
    {
        let headers:[String:String] = ["Authorization":"627562626c6520617069206b6579"]
        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        Alamofire.request(escapedString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200 ..< 501).responseJSON { (response) in
            handleResponse(response: response, success: success, failure: failure)
            }.responseString{ (response) in
//                print(response)
        }
    }
//    class public func performGetWithToken(urlString:String,success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
//    {
//        let headers:[String:String] = ["Content-Type":"application/x-www-form-urlencoded","Access-Token":DTOUser.access_token()]
//        let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
//        Alamofire.request(escapedString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200 ..< 501).responseJSON { (response) in
//            handleResponse(response: response, success: success, failure: failure)
//            }.responseString{ (response) in
//                print(response)
//        }
//    }

    //post
    class public func performPost(urlString:String,extraHeaders:[String:String]?,postData:[String:Any],success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
    {
        let headers:[String:String] = ["Authorization":"627562626c6520617069206b6579"]
//        headers["Content-Type"]  = "application/json"
//        if let dic = extraHeaders {
//            for item in dic{
//                headers[item.key] = item.value
//            }
//        }
//        print(headers)
        
        Alamofire.request(urlString, method: .post, parameters: postData, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200 ..< 501)
            .responseJSON { response in
                handleResponse(response: response, success: success, failure: failure)
            }
            .responseString { (response) in
//                print(response)
        }
        
    }
//    class public func performPostWithToken(urlString:String,postData:[String:Any],success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
//    {
//        let headers = ["Access-Token":DTOUser.access_token()]
//        self.performPost(urlString: urlString, extraHeaders: headers, postData: postData, success: success, failure: failure)
//
//    }
//
//    class public func performPut(urlString:String,success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
//    {
//        let headers = ["Content-Type":"application/x-www-form-urlencoded"]
//        Alamofire.request(urlString, method: .put, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200 ..< 501)
//            .responseJSON { response in
//                handleResponse(response: response, success: success, failure: failure)
//            }.responseString{ (response) in
//                print(response)
//        }
//
//    }
    //delete
//    class public func performDelete(urlString:String,success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
//    {
////        let url = Foundation.URL(string:urlString)!
//        let headers:[String:String] = ["Authorization":"627562626c6520617069206b6579"]
//
//        Alamofire.request(urlString, method: .delete, parameters: nil, encoding: URLEncoding.default, headers: headers).validate(statusCode: 200 ..< 501)
//            .responseJSON { response in
//            handleResponse(response: response, success: success, failure: failure)
//        }
//    }

    //handling
    class private func handleResponse(response:DataResponse<Any>,success:@escaping ConnectionSuccess,failure:@escaping ConnectionFailed)
    {
        switch response.result {
        case .success(let value):
            guard let ss = value as?  [String:Any] else {
                let errorTemp = NSError(domain:"", code:401, userInfo:[:] as? [String : Any])
                failure(errorTemp)
                 return
            }
//             print(ss["error"])
            let json = JSON(value)
            if let error = json["error"].string , error == "invalid_token"
            {
                   let userInfo: [AnyHashable : Any] =
                    [
                        NSLocalizedDescriptionKey :  NSLocalizedString("Unauthorized", value: "invalid_token", comment: "") ,
                        NSLocalizedFailureReasonErrorKey : NSLocalizedString("Unauthorized", value: "invalid_token", comment: "")
                ]
                let errorTemp = NSError(domain:"", code:401, userInfo:userInfo as? [String : Any])
                failure(errorTemp)
            }else
            {
                success(json)
            }
        case .failure(let error):
//            print(error.localizedDescription)
            failure(error)
        }
    }
    
}
