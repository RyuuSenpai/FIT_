//
//  Post_Image.swift
//  Hyper
//
//  Created by admin on 5/3/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class  Post_Image_Requests {
    
    
    
    private  let longSessionManager : SessionManager = {
        let con = URLSessionConfiguration.default
        con.timeoutIntervalForResource = TimeInterval(60)
        con.timeoutIntervalForRequest = TimeInterval(60)
//        con.httpAdditionalHeaders = Constant.headers
         return  Alamofire.SessionManager(configuration: con)
    }()
    
    
    func postProfileUpdate(  parameters : [String : Any] ,   image :  UIImage ,completed : @escaping (String)->(),failed : @escaping () -> ()) {
        let url = Connection.URLS_Post_Enum.edit_Image.stringValue() //"http://hyper-testing.herokuapp.com/api/User/edit_user_image?UserID=\(ad.getUserID())" //Constant.main_url + "User/edit_user_image"
        print(url)
        
        

        let imgData = UIImageJPEGRepresentation(image, 1)!

        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "ProfileImage",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//             } //Optional for extra parameters
//            multipartFormData.append("\(9)".data(using: String.Encoding.utf8)!, withName: "UserID")

        },
                         to:url, method: .post, headers: Constant.headers)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value)
                    guard let value = response.value else {
                        failed()
                        return
                    }
                    let jData = JSON(value)
 
                    let imge = jData["response"].stringValue
                    let img = Constant.images_Url + imge
                     completed(img)
                }
                
            case .failure(let encodingError):
                print(encodingError)
                failed()
            }
        }
        
        
        
//        longSessionManager.upload(multipartFormData: { (multipartFormData) in
//            for (key,value) in imageDict{
//                if let imageData = UIImageJPEGRepresentation(value, 1) {
//                    //                    multipartFormData.append(imageData, withName: key, fileName: "file.jpeg", mimeType: "image/jpeg")
//                    multipartFormData.append(imageData, withName: key, fileName: "swift_file.jpg", mimeType: "image/jpg")
//                }
//            }
//            print(parameters)
//            for (key, value) in parameters {
//                //                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key as String)
//                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//            }
//        }, to:url, method: .post, headers: Constant.headers)
//        { (result) in
//            switch result {
//            case .success(let upload, _, _):
//
//                //                upload.uploadProgress(closure: { (Progress) in
//                //                    print("Upload Progress: \(Progress.fractionCompleted)")
//                //                })
//
//                upload.responseJSON { response in
//                    //self.delegate?.showSuccessAlert()
//                    //                    print("original URL request\n\(response.request)\n\n")  // original URL request
//                    //                    print("response \n:\(response.response)\n\n") // URL response
//                    //                    print("data :\n\(response.data)\n\n")      // server data
//                    //                    print("result :\n\(response.result)\n\n")    // result of response serialization
//                    //                        self.showSuccesAlert()
//                    //self.removeImage("frame", fileExtension: "txt")
//
//                    guard  let value = response.result.value else {
//                        print(response.result.error?.localizedDescription)
//                        completed(false,"Failed,Please try again")
//                        return
//                    }
//                    let json = JSON( value) // SwiftyJSON
//                    print("that;s json \(json)")
//
////                    let parm = Constants.API.Parameters()
//
//
//                    let sms = json["message"].string ?? json["message"].stringValue
//                    let status =  json["message"].string  == nil ? false : true
//
//                    //                    print("that's timeline : \(data.timeSlots) email : \(data.email) /n id : \(data.id)that's status \(statusCode) status \(status) sms: \(sms)////")
//
//                    completed(  status ,sms)
//                }
//
//            case .failure(let encodingError):
//                //self.delegate?.showFailAlert()
//                print(encodingError.localizedDescription)
//                completed(false,"Failed to Connect")
//            }
//
//        }
    }
    
    
    
    
    
}
