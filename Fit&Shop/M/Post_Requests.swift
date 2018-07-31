//
//  Post_Requests.swift
//  Hyper
//
//  Created by admin on 3/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON




//MARK: Post_Requests
class  Post_Requests : Connection {
    
    private let main_url = Constant.main_url

    
    
    func defaultPostRequest(postType:URLS_Post_Enum ,parms : Parameters ,completion:@escaping ( JSON ) -> (),failure failed: @escaping (String?)->() ) {
        //http://45.55.134.13/api/v1/places/1/8/20
        //        print("URL: is getPlacesList URL : \(url) location is  \(ad.currentLocation)")
        //        print("lat is \(ad.latitude) lon is \(ad.longitude)")
        
 
        Alamofire.request(postType.stringValue(), method: .post, parameters: parms,encoding: JSONEncoding.default, headers: Constant.headers).responseJSON {
            response in
            print(postType.stringValue())
            print(parms)
            switch response.result {
            case .success:
                                print(response)
                guard let value = response.value else {
                    failed(response.error?.localizedDescription)
                    return
                }
                let jData = JSON(value)
                completion(jData)
                
                break
            case .failure(let error):
                failed(response.error?.localizedDescription)
                                print(response.error?.localizedDescription)
            }
        }
    }
    

    func getUserHomeData_request(postType:URLS_Post_Enum ,parms : Parameters ,completion:@escaping ( [Brands_DataModel], Profile_Details_M ) -> (),failure failed: @escaping (String?)->() ) {
        //http://45.55.134.13/api/v1/places/1/8/20
                print("URL: is getUserHomeData_request URL : \(postType.stringValue())")
        //        print("lat is \(ad.latitude) lon is \(ad.longitude)")
        
        
        let url = postType.stringValue() + "?UserID=\(ad.getUserID())"
        Connection.performGet(urlString: url, success: { (jData) in
            
            
            
            print(url)
            print(parms)
            print(jData)
            var data  : [Brands_DataModel]  = []
            let userData = jData["user"]
            
    let user = Profile_Details_M(userData)
            
            for x in  jData["response"]["brands"] {
                data.append(Brands_DataModel(json: x.1))
            }
            completion(data,user)
        }) { (err) in
            
            
            failed(err?.localizedDescription)
        }
        
 
    }
    
       var alamoFireManager : SessionManager? // this line
    func editImage_requestURl( image:UIImage? ,success : @escaping (String) -> () ,failure failed: @escaping (String?)->() ) {
        
        print(Connection.URLS_Post_Enum.edit_Image.stringValue())
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        alamoFireManager = Alamofire.SessionManager(configuration: configuration) // not in this line

//        let image = UIImage.init(named: "myImage")
        let imgData = UIImageJPEGRepresentation(image!, 0.2)!
        
 //Alamofire.upload
        alamoFireManager?.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
//            for (key, value) in parameters {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            } //Optional for extra parameters
        },
                         to:Connection.URLS_Post_Enum.edit_Image.stringValue())
        { (result) in
            switch result {
            case .success(let upload, _, _):

                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })

                upload.responseJSON { response in
                    print(response.result.value)
                    success("Done")
                }

            case .failure(let encodingError):
                print(encodingError.localizedDescription)
                failed("Failed")
            }
        }

        
//        alamoFireManager?.upload(multipartFormData: { (multipartFormData) in
//
//            if let image = image
//            {
//                if let imageData = UIImageJPEGRepresentation(image, 1) {
//                    //                    multipartFormData.append(imageData, withName: key, fileName: "file.jpeg", mimeType: "image/jpeg")
//                    multipartFormData.append(imageData, withName: "image", fileName: "swift_file.jpg", mimeType: "image/jpg")
//                }
//            }
//
////            for (key, value) in parameters {
////                //                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key as String)
////                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
////            }
//        }, to:Connection.URLS_Post_Enum.edit_Image.stringValue(), method: .post, headers: nil)
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
//                    print("original URL request\n\(response.request)\n\n")  // original URL request
//                    print("response \n:\(response.response)\n\n") // URL response
//                    print("data :\n\(response.data)\n\n")      // server data
//                    print("result :\n\(response.result)\n\n")    // result of response serialization
//                    //                        self.showSuccesAlert()
//                    //self.removeImage("frame", fileExtension: "txt")
//
//                    guard  let value = response.result.value  else {
//                        print(response.result.error?.localizedDescription)
//                        return
//                    }
//                    let json = JSON( value) // SwiftyJSON
//                    print("that;s json \(json)")
//
//
//                    let status = json["error"]["message"] != nil ? true : false
//
//                    //                    let status = statusCode == nil ? false : true
//                    let sms = json["error"]["message"].string ?? json["error"]["message"].stringValue
//
//                    if(status)
//                    {
//                        failed(sms)
//                    }
//                    else {
//
//                        success( json["token"].stringValue)
//                    }
//                }
//
//            case .failure(let encodingError):
//                //self.delegate?.showFailAlert()
//                print(encodingError)
//                failed("error")
//            }
//
//        }
    }
    
    
    func getUserData_request(completion:@escaping ( Profile_Details_M ) -> (),failure failed: @escaping (String?)->() ) {
        //http://45.55.134.13/api/v1/places/1/8/20
         //        print("lat is \(ad.latitude) lon is \(ad.longitude)")
        
        
        let url = URLS_Get_Enum.Profile_Data.stringValue() + "\(ad.getUserID())"
        Connection.performGet(urlString: url, success: { (jData) in
            
            
            
            print(url)
             print(jData)
             let userData = jData["user"]
            
            let user = Profile_Details_M(userData)
            
             completion(user)
        }) { (err) in
            
            
            failed(err?.localizedDescription)
        }
 
    }
    
    
    func getNewsFeedData_request(completion:@escaping ( [NewsFeedsDetailsData] ) -> (),failure failed: @escaping (String?)->() ) {
        //http://45.55.134.13/api/v1/places/1/8/20
        //        print("lat is \(ad.latitude) lon is \(ad.longitude)")
        
        
        let url = URLS_Get_Enum.New_Feeds.stringValue()
        Connection.performGet(urlString: url, success: { (jData) in
            
            
            
            print(url)
            print(jData)
            let feeds = jData["feed"]
            var data = [NewsFeedsDetailsData]()
            for x in feeds  {
                data.append(NewsFeedsDetailsData(json: x.1))
            }

             completion(data)
        }) { (err) in
            
            
            failed(err?.localizedDescription)
        }
        
    }
    
    
    func social_Login(postType:Connection.URLS_Post_Enum ,parms : Parameters ,completion:@escaping ( Profile_Details_M ) -> (),failure failed: @escaping (String?)->() ) {
        //http://45.55.134.13/api/v1/places/1/8/20
        //                print("URL: is getPlacesList URL : \(postType.stringValue()) ")
                print("URL: is getPlacesList URL : \(parms) ")
        
        //        print("lat is \(ad.latitude) lon is \(ad.longitude)")
        Alamofire.request(postType.stringValue(), method: .post, parameters: parms,encoding: JSONEncoding.default, headers: Constant.headers).responseJSON {
            response in
            switch response.result {
            case .success:
                                                print(response)
                guard let value = response.value else {
                    failed(response.error?.localizedDescription)
                    return
                }
                print(parms)
                print(value)
                let jData = JSON(value)
                let userData = jData["user"]
                                                
                                               
            guard userData.stringValue !=  "-2" else {
                failed(jData["message"].stringValue)
            return
                                                }
                guard userData.dictionary != nil else {
                    failed("\(jData["message_code"].intValue)")
                    return
                }
                let y = Profile_Details_M(userData)
            
                completion(y)
                
                
                break
            case .failure(let error):
                failed(response.error?.localizedDescription)
                //                print(error)
            }
        }
    }
}

