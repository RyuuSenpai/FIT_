//
//  UIViewControllerExt.swift
//  Hyper
//
//  Created by admin on 3/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
//    func hideKeyboardWhenTapped() {
//        
//        let tap  = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//    
//    @objc func dismissKeyBoard() {
//        view.endEditing(true)
//    }
//    
//    func setupNav() {
//        let navV = NavigationBarView()
////        navV.translatesAutoresizingMaskIntoConstraints = false
//        let height : CGFloat = ad.isIphoneX ? 68 : 68
//        navV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
//        self.view.addSubview(navV)
//        navV.tag = 101
//        navV.titleS = title ?? ""
//        navV.backBtn.addTarget(self , action: #selector(dismissPushedView), for: .touchUpInside)
//        
//
//    }
//    func setupEmptyList(withTitle : String) -> EmptyListView {
//        let navV = EmptyListView()
//         //        navV.translatesAutoresizingMaskIntoConstraints = false
////        let height : CGFloat = ad.isIphoneX ? 68 : 68
//        navV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        self.view.addSubview(navV)
//        self.view.sendSubview(toBack: navV)
//        navV.titleS = withTitle
//        return navV
//  
//        
//    }
//    func setupNav(withTitle : String) {
//        let navV = NavigationBarView()
//        navV.tag=101
//        //        navV.translatesAutoresizingMaskIntoConstraints = false
//        let height : CGFloat = ad.isIphoneX ? 68 : 68
//        navV.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
//        self.view.addSubview(navV)
//        navV.titleS = withTitle
//        navV.backBtn.addTarget(self , action: #selector(dismissPushedView), for: .touchUpInside)
//        
//        
//    }
    @objc func dismissPushedView() {
        if self.navigationController != nil {
            self.navigationController?.popViewController(animated: true)

        }else {
            self.dismiss(animated: true, completion: nil)
        }
     }
    
 
    
//    func getSearchFilterData(parms : [String:Any] , page : Int,completed : @escaping (ProductFull_Data)->(),failed : @escaping (String?)->()) {
//        ad.isLoading()
//        Post_Requests().postFilter_data(parms: parms, page: page, completion: { (rData ) in
//
//            DispatchQueue.main.async {
//
//                completed(rData)
//                ad.killLoading()
//            }
//
//
//        }) { (err ) in
//
//            DispatchQueue.main.async {
//                ad.killLoading()
//                self.showApiErrorSms(err: err)
//                failed(err)
//            }
//        }
//    }
    
    
    
//    func showMoreMenu(data : Product_Data) {
//
//        let actionController = YoutubeActionController()
//
//        actionController.addAction(Action(ActionData(title: L0A.Add_To_Cart.stringValue(), image: UIImage(named: "ic_cart_unactive_")!), style: .default, handler: { action in
//            if let tabItems = self.tabBarController?.tabBar.items as NSArray!
//            {
//                // In this case we want to modify the badge number of the third tab:
//                let tabItem = tabItems[4] as! UITabBarItem
//                tabItem.badgeValue = "1"
//
//            }
//
//        }))
//        actionController.addAction(Action(ActionData(title: L0A.Visit_Category.stringValue(), image: UIImage(named: "yt-add-to-playlist-icon")!), style: .default, handler: { action in
//
//            self.tabBarController?.selectedIndex = 1
//        }))
//        actionController.addAction(Action(ActionData(title: L0A.Visit_Brand.stringValue(), image: UIImage(named: "yt-add-to-playlist-icon")!), style: .default, handler: { action in
//            let vc = BrandsVC()
//            self.navigationController?.pushViewController(vc, animated: true)
//        }))
//        actionController.addAction(Action(ActionData(title: L0A.Share.stringValue(), image: UIImage(named: "yt-share-icon")!), style: .default, handler: { action in
//
//               let shareText = data.name
//            var parm :[Any] = [shareText]
//            if let url = URL(string : data.main_image )
//            {
//                parm.append(url)
//            }
//
//            let vc = UIActivityViewController(activityItems: parm, applicationActivities: [])
//            self.present(vc, animated: true)
//
//        }))
//        actionController.addAction(Action(ActionData(title: L0A.Cancel.stringValue(), image: UIImage(named: "yt-cancel-icon")!), style: .cancel, handler: nil))
//
//        present(actionController, animated: true, completion: nil)
//    }
    
//    func searchDidSelectResponse(data: ProductFull_Data?, catData: Categories_Specefications_Data?) {
//        guard let dataa = catData else {
//            guard let rData = data else { return}
//            let vc = ProductsListVC(nibName: "ProductsListVC", bundle: nil)
//            vc.data = rData.productList
//            vc.fullData = rData
//            vc.title = "Item"
//            self.navigationController?.pushViewController(vc, animated: true)
//
//
//            return
//        }
//        let sb = self.storyboard ?? UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "SelectedBrandVC") as! SelectedBrandVC
//        vc.mainData = dataa
//        vc.title = dataa.cat_name
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    func showApiErrorSms(err : String?) {
       print(err )
        DispatchQueue.main.async {
            guard    let err = err , !err.contains("off")  , !err.contains("server")   else {
                self.view.showSimpleAlert( "Error","لا يوجد إتصال بالشبكة", .error)
                ad.killLoading()
                return}
            guard  !err.contains("failed va") else {
                print(err)
                self.view.showSimpleAlert("حدث خطأ في الإتصال","برجاء التأكد من المعلومات المرسلة", .error)
                ad.killLoading()
                return}
            guard   !err.contains("a") || err != "" ||  !err.contains("out") ,  !err.contains("off")    else {
                self.view.showSimpleAlert("حدث خطأ في الإتصال", "برجاء المحاوله مره اخري", .error)
                ad.killLoading()
                return}
            
            self.view.showSimpleAlert( "Warning", err, .error)
            ad.killLoading()
        }
     }
    func showApiSuccessSms(suc : String?) {
        print(suc )
        DispatchQueue.main.async {
         
            guard let succ = suc ,   !succ.contains("suc") else {
                self.view.showSimpleAlert( "Done", "", .success)
                ad.killLoading()
                return}
           
            
            self.view.showSimpleAlert("Done", succ, .success)
            ad.killLoading()
        }
    }
    
    
    
    func showApiCustomErrorSms(err : String?) {
      ////print(err )
       showApiErrorSms(err : err)
    }
//    func navigatieToItemList(data: ProductFull_Data,pageTitleMap :String ) {
//
//             let vc = ProductsListVC(nibName: "ProductsListVC", bundle: nil)
////            vc.data = data.productList
//            vc.fullData = data
//            vc.title = pageTitleMap
//            self.navigationController?.pushViewController(vc, animated: true)
//
//
//    }
//
//    func openSearchVC() {
//        let vc = SearchControllerVC()
//        vc.modalTransitionStyle = .crossDissolve
//        vc.delegate = self as? SearchControllerProtocol
//        self.present(vc, animated: true, completion: nil    )
//    }
}


 
