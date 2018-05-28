//
//  BodyMeasurementVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SSSlider
import SwiftyJSON

class BodyMeasurementVC: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var horizontalSlider: SSSlider!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var percentLbl: UILabel!
    @IBOutlet weak var backImgV : UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
     var data : [BodyM_Model] = []
    var pieceType : Piece_By_ID!
    var profileData : Profile_Details_M?
    var isEditingMeasur = false
    var selectionArr : [Int:SavedMesurments] = [:] {
     
        didSet {
	            print(selectionArr)
            let perc = Double(selectionArr.count) * 0.25
            horizontalSlider.setValue(percent: CGFloat(perc), animated: true)
            percentLbl.text = "\(perc * 100)%"
        }
        
    }

    @IBAction func backBtnhandler(_ sender: UIButton) {
        
self.dismissPushedView()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if phoneNum == "" {
//            backImgV.alpha = 1
//        }else {
//            backImgV.alpha = 0
//        }
        horizontalSlider.value = 0.0
        horizontalSlider.isUserInteractionEnabled = false 
setupSegment()
        data.append(BodyM_Model(title: "Chest", body: "Measure your chest at the widest point.Stand in a relaxed posture and breath out.", image: UIImage(named:"pic_chest")))
        
                data.append(BodyM_Model(title: "Waist", body: "Measure your waist just above your belly button. or at the narrow point. (Stand staight and relaced posture and breathe out", image: UIImage(named:"pic_hips")))
        
        data.append(BodyM_Model(title: "Hips", body: "Take the circumference measurement around your hips at the widest part.", image: UIImage(named:"pic_waist")))

                data.append(BodyM_Model(title: "Shirt Length", body: "Measure your Top Body Length from shoulder to Hips.", image: UIImage(named:"pic_length")))

        tableView.delegate = self
        
        tableView.dataSource = self
        tableView.rowHeight = 187
         tableView.register(UINib(nibName: "BodyMeasurementCell", bundle: nil), forCellReuseIdentifier: "BodyMeasurementCell")
hideKeyboardWhenTapped()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLbl.text = title ?? ""

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BodyMeasurementCell", for: indexPath) as! BodyMeasurementCell
        cell.classDelegate = self
        cell.tag = indexPath.row
        cell.configCell(data: data[indexPath.row])
        return cell
    }
    
    
    func setupSegment() {
        horizontalSlider.didChangeValueBegan = { (slider, value) in
            print("HorizontalSlider change value began \(value)")
        }
        horizontalSlider.didChangeValue = { (slider, value) in
            print("HorizontalSlider change value \(value)")
        }
        horizontalSlider.didChangeValueEnded = { (slider, value) in
            print("HorizontalSlider change value end \(value)")
        }
    }
    @IBAction func saveDataHandler(_ sender: UIButton) {
        
        guard selectionArr.count == 4 else {
            self.view.showSimpleAlert("Sorry", "Complete the Measurments if you please.", .warning)
            return
        }

//        guard phoneNum != "" else {
////            if let name_  =  UserDefaults.value(forKey: "usreName") as? String , let phoneNum_ =   UserDefaults.value(forKey: "usreName") as? String, let id =   UserDefaults.value(forKey: "userId") as? Int    {
////            self.view.showSimpleAlert("Done", "You have Completed the Measurments.", .success)
////                sendData(name: name_, phoneNum: phoneNum_ , userID : id)
//
////            }else {
////
////                ad.saveUserLogginData(mobileNum: nil, uid: nil, name: nil)
////                ad.reloadWithAnimationToRegister()
////
////            }
////
//            self.view.showSimpleAlert("Done", "You have Completed the Measurments.", .success)
//            self.navigationController?.popViewController(animated: true)
//
//            return
//        }
       
        sendData( )
//        performSegue(withIdentifier: "savedData", sender: self)
//        let vc = ItemDetailsVC()
//
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    func sendData( ) {
        guard let ch = selectionArr[0]?.measure ,
        let waist = selectionArr[1]?.measure ,let hips = selectionArr[2]?.measure ,let length = selectionArr[3]?.measure else {
            
            return
        }
        let parm : [String : Any] = [
             "chest":ch,
            "waist":waist,
            "hips":hips,
            "length":length,
            "user_id" : profileData?.id ?? 0 ,
            "type" : isEditing ? 0  : pieceType.rawValue
        ]
        ad.isLoading()
        Post_Requests().defaultPostRequest(postType: Connection.URLS_Post_Enum.saveMeauseData, parms: parm, completion: {(rData ) in
            DispatchQueue.main.async {
                ad.killLoading()
                let id = rData["response"]["id"].intValue
                print(rData, id )
                
               
                self.view.showSimpleAlert("Done", "You have Completed the Measurments.", .success)
//                if self.phoneNum != "" {
                guard !self.isEditingMeasur else {
                    self.dismissPushedView()
                    return
                }
                if let data = self.profileData {
                    ad.saveUserLogginData(mobileNum: nil, uid: data.id, name: data.first_name)
                }
                ad.reloadWithAnimationToHome()
//                }else {
//                    self.navigationController?.popViewController(animated: true)
//                }
                
            }
            
        }) { (err ) in
            DispatchQueue.main.async {
                ad.killLoading()
                self.view.showSimpleAlert("Something Went wrong,Please try again.", err, .error)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
