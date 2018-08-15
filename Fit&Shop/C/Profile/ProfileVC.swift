//
//  ProfileVC.swift
//  Fit&Shop
//
//  Created by Killva on 7/15/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController  , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImgV: UIImageView!
    
    var updatedImg : UIImage?
    var imgDict : [(String , UIImage)]!
    var profileData : Profile_Details_M? {
        didSet {
            nameLbl?.text = profileData?.fullName ?? ""
            emailLbl?.text = profileData?.email ?? ""
            guard let imgS = profileData?.image else { return }
            self.profileImgV?.setupApiImage(imagePath: imgS, placeHolderImg: UIImage(named:"ic_profile_pic_")! )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
//        imgDict  = [("Edit",UIImage(named:"ic_edit_")!),//0
//            ("Rate Us",UIImage(named:"ic_rate_")!),//1
//            ("Share",UIImage(named:"ic_share_")!),//2
//            ("Language",UIImage(named:"ic_language_")!),//3
//            ("About Us",UIImage(named:"ic_aboutus_")!),//4
//            ("Logout",UIImage(named:"ic_logout_")!) ]//5
       imgDict  =  [(L0A.Edit.stringValue(),UIImage(named:"ic_edit_")!),//0
            (L0A.Rate_US.stringValue(),UIImage(named:"ic_rate_")!),//1
            (L0A.Share.stringValue(),UIImage(named:"ic_share_")!),//2
            (L0A.lang.stringValue(),UIImage(named:"ic_language_")!),//3
            (L0A.about_us.stringValue(),UIImage(named:"ic_aboutus_")!),//4
            (L0A.Sign_out.stringValue(),UIImage(named:"ic_logout_")!),//5
           ]
        
    
        getUserData()
      }
    
    func getUserData() {
        ad.isLoading()
        Post_Requests().getUserData_request(completion: { [weak self ] (rData ) in
            
            DispatchQueue.main.async {
                self?.profileData = rData
                
                ad.killLoading()
            }
        }) { (err ) in
            self.showApiErrorSms(err: err )
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        if let img = updatedImg  {
            self.profileImgV.image = img 
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileImgV.layer.cornerRadius = self.profileImgV.frame.width / 2
        self.profileImgV.layer.masksToBounds = false
        self.profileImgV.clipsToBounds = true 
    }
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        cell.iconImageV.image = imgDict[indexPath.row].1
        cell.titleLbl.text = imgDict[indexPath.row].0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4.6
        return CGSize(width: width, height: width * 1.5 )
    }
    
    
    func change() {
        
//        var transition: UIViewAnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
//            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        ad.reloadWithAnimationToHome()
    }
  
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 25
//    }
//
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width:  self.view.frame.width, height: self.view.frame.height * 0.45)
//    }
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         //          self.navigationController?.pushViewController(vc, animated: true)
        let dataa = imgDict[indexPath.row].0
        switch indexPath.row {
        case 0 :
            let vc = EditProfileVC()
            vc.data = self.profileData
            vc.delegate = self 
            self.navigationController?.pushViewController(vc, animated: true )
        case 1 :
            rateApp( completion: { (booll) in
                //                print(booll)
            })
        case 2 :
            share()
        case 3 :
             change()
        case 4 :
            let vc = AboutUsVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5 :
            ad.saveUserLogginData(mobileNum: nil, uid: nil, name: nil)
            Constant.setUserLoginType(isNormalLogin: false)
            ad.reloadWithAnimationToRegister()
            
        default : break
        }
        if indexPath.row == 5 {
        }
       
    }
    
 
    func share() {
        let shareText = "Hyper Techno \n https://itunes.apple.com/us/app/hyper-techno/id1382143993?ls=1&mt=8"
        //        let  strURL = ""
        let parm :[Any] = [shareText]
        //        if let url = URL(string : data.main_image )
        //        {
        //            parm.append(strURL)
        //        }
        
        let vc = UIActivityViewController(activityItems: parm, applicationActivities: [])
        self.present(vc, animated: true)
    }
    func rateApp(  completion: @escaping ((_ success: Bool)->())) {
        //https://itunes.apple.com/us/app/hyper-techno/id1375333362?ls=1&mt=8
        let appId = "id1382143993"
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId
            ) else {
                completion(false)
                return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    
}

extension ProfileVC : UpdatedProfilePic  {
    
    func hasUpdatedProfileImg(img : UIImage)
    {
        
        updatedImg = img
        
    }
}
