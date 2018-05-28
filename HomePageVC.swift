
//
//  HomePageVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import MXSegmentedControl

class HomePageVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: MXSegmentedControl!

    var data : [Brands_DataModel] = []
    var selectedShop : Brands_DataModel?
    var profileData : Profile_Details_M?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 64.5
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        setupDataM()
        
        tableView.register(UINib(nibName:"CategoriesCell",bundle:nil), forCellReuseIdentifier: "CategoriesCell")
        
    
       
//        navigationItem.titleView = segmentedControl
    }
    
    @IBAction func signoutHandler(_ sender: UIButton) {
        ad.saveUserLogginData(mobileNum: nil, uid: nil, name: nil)
        ad.reloadWithAnimationToRegister()
    }
    @objc func changeIndex(segmentedControl: MXSegmentedControl) {
        
        self.selectedShop = data[segmentedControl.selectedIndex]
        self.tableView.reloadData()
//        switch segmentedControl.selectedIndex {
//        case 0:
//            segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.4392156863, blue: 0.3803921569, alpha: 1)
//        case 1:
//            segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.2044631541, green: 0.7111002803, blue: 0.898917675, alpha: 1)
//        case 2:
//            segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        default:
//            break
//        }
    }
    
    func setupDataM() {
        
//        let daa1 = [CategoriesDataM(name:"T-Shirt", size: "X", id: 0),CategoriesDataM(name:"Shirts", size: "XL", id: 1),CategoriesDataM(name:"Sweatshirt", size: "S", id: 2),CategoriesDataM(name:"Jeans", size: "XXL", id: 3),CategoriesDataM(name:"Pullover", size: "SS", id: 4)]
//        let daa2 = [CategoriesDataM(name:"T-Shirt", size: "X", id: 0),CategoriesDataM(name:"Coats & Jackets", size: "XXL", id: 5),CategoriesDataM(name:"Shirts", size: "XL", id: 1),CategoriesDataM(name:"Sweatshirt", size: "S", id: 2),CategoriesDataM(name:"Jeans", size: "XXL", id: 3),CategoriesDataM(name:"Pullover", size: "SS", id: 4)]
//        let daa3 = [CategoriesDataM(name:"T-Shirt", size: "X", id: 0),CategoriesDataM(name:"Coats & Jackets", size: "XXL", id: 5),CategoriesDataM(name:"Shirts", size: "XL", id: 1) ]
//        let daa4 = [ CategoriesDataM(name:"Coats & Jackets", size: "XXL", id: 5),CategoriesDataM(name:"Shirts", size: "XL", id: 1) ]
//
//
//
//    data.append(ShopData(shopname: "Ravin", catData: daa1))
//        data.append(ShopData(shopname: "H&M", catData: daa2))
//
//        data.append(ShopData(shopname: "Zara", catData: daa3))
//        data.append(ShopData(shopname: "Nas", catData: daa1))
//        data.append(ShopData(shopname: "Chanel", catData: daa4))
//        data.append(ShopData(shopname: "Guess", catData: daa3))
//        data.append(ShopData(shopname: "Maher", catData: daa2))
//        data.append(ShopData(shopname: "Eslam", catData: daa4))
        ad.isLoading()
        Post_Requests().getUserHomeData_request(postType: .get_user_measurment_by_id, parms: [:], completion: { (rData ,user)  in
            
            DispatchQueue.main.async {
                ad.killLoading()
                self.data = rData
                print(user)
                self.profileData = user
                if rData.count >= 1 {
                self.selectedShop = self.data[0]
                }
                for x in self.data {
                    self.segmentedControl.append(title: x.brandName)
                        .set(title: #colorLiteral(red: 0.09810762852, green: 0.2034293413, blue: 0.2315387726, alpha: 1), for: .selected)
                }
                self.segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.09810762852, green: 0.2034293413, blue: 0.2315387726, alpha: 1)
                self.segmentedControl.addTarget(self, action: #selector(self.changeIndex(segmentedControl:)), for: .valueChanged)
//                self.view.showSimpleAlert("Netwo", "", .error)
                self.segmentedControl.setNeedsLayout()
                self.tableView.reloadData()

            }
        }) { (err ) in
            DispatchQueue.main.async {
                ad.killLoading()
                self.view.showSimpleAlert("Network Error", "", .error)
            }
        }
       

    }

    @IBAction func tabBtnHandler(_ sender: UIButton) {
        if sender.tag == 2 {
            
            let vc =  self.storyboard?.instantiateViewController(withIdentifier: "BodyMeasurementVC") as! BodyMeasurementVC
            vc.profileData = profileData
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedShop?.fittedClothesData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        guard let data = selectedShop?.fittedClothesData else { return cell }
        cell.configCell(data: data[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imgV = UIImageView(image: UIImage(named:"img_brand"))
        imgV.contentMode = .scaleToFill
        return imgV
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.width * 0.85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSel = self.selectedShop?.fittedClothesData[indexPath.row] else { return }
        let vc = ItemDetailsVC()
        vc.title = selectedShop?.fittedClothesData[indexPath.row].piece_name
        vc.data = dataSel
        self.navigationController?.pushViewController(vc, animated: true    )
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

//struct ShopData {
//
//    var shopname : String!
////    var image : String!
//    var catData : [CategoriesDataM] = []
//}
//
//struct CategoriesDataM {
//
//   var name : String!
//    var size : String!
//    var id : Int!
//}

