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
    
    var imgDict : [(String , UIImage)]!
    var profileData : Profile_Details_M?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        imgDict  = [("Edit",UIImage(named:"ic_edit_")!),//0
            ("Rate Us",UIImage(named:"ic_rate_")!),//1
            ("Share",UIImage(named:"ic_share_")!),//2
            ("Language",UIImage(named:"ic_language_")!),//3
            ("About Us",UIImage(named:"ic_aboutus_")!),//4
            ("Logout",UIImage(named:"ic_logout_")!) ]//5
        
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
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
        case 4 :
            let vc = AboutUsVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case 5 :
            ad.saveUserLogginData(mobileNum: nil, uid: nil, name: nil)
            ad.reloadWithAnimationToRegister()
        default : break
        }
        if indexPath.row == 5 {
        }
       
    }
    
 
}
