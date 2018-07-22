
//
//  HomePageVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit


class HomePageVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    var data : [Brands_DataModel] = []
    var selectedShop : Brands_DataModel?
    var profileData : Profile_Details_M?
    let brandImages = [#imageLiteral(resourceName: "brand_Ravin"),#imageLiteral(resourceName: "brand_Nas"),#imageLiteral(resourceName: "Town_team")]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 64.5
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        setupDataM()
        
        tableView.register(UINib(nibName:"CategoriesCell",bundle:nil), forCellReuseIdentifier: "CategoriesCell")
        
        tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
    
       ad.fcm()
//        navigationItem.titleView = segmentedControl
    }
    
    @IBAction func signoutHandler(_ sender: UIButton) {
        ad.saveUserLogginData(mobileNum: nil, uid: nil, name: nil)
        ad.reloadWithAnimationToRegister()
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
                /*
                for x in self.data {
                    self.segmentedControl.append(title: x.brandName)
                        .set(title: #colorLiteral(red: 0.09810762852, green: 0.2034293413, blue: 0.2315387726, alpha: 1), for: .selected)
                }
                self.segmentedControl.indicator.lineView.backgroundColor = #colorLiteral(red: 0.09810762852, green: 0.2034293413, blue: 0.2315387726, alpha: 1)
                self.segmentedControl.addTarget(self, action: #selector(self.changeIndex(segmentedControl:)), for: .valueChanged)
//                self.view.showSimpleAlert("Netwo", "", .error)
                self.segmentedControl.setNeedsLayout()
                 */
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
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BodyMeasureVC") as! BodyMeasureVC //BodyMeasureVC()
            vc.profileData = profileData
            vc.isEditingMeasurement = true 
            self.present(vc, animated: true, completion: nil)
//            let vc =  self.storyboard?.instantiateViewController(withIdentifier: "BodyMeasurementVC") as! BodyMeasurementVC
//            vc.profileData = profileData
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].isOpened ? self.data[section].fittedClothesData.count + 1 ?? 0 : 1
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.row == 0 else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            let data = self.data[indexPath.section].fittedClothesData
            cell.configCell(data: data[indexPath.row - 1 ])
            cell.selectionStyle = .none
            return cell
         }
        tableView.register(UINib(nibName:"BrandsCell",bundle:nil), forCellReuseIdentifier: "BrandsCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "BrandsCell", for: indexPath) as! BrandsCell
//        cell.textLabel?.text = data[indexPath.section].brandName
        cell.imageV.image = nil 
        cell.imageV.image = brandImages[indexPath.section]
        return cell
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let imgV = UIImageView(image: UIImage(named:"img_brand"))
//        imgV.contentMode = .scaleToFill
//        return imgV
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return self.view.frame.width * 0.85
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 0 else {
          let dataSel = self.data[indexPath.section].fittedClothesData[indexPath.row - 1]
        let vc = ItemDetailsVC()
        vc.title = dataSel.piece_name
        vc.data = dataSel
        self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        if  self.data[indexPath.section].isOpened {
             self.data[indexPath.section].isOpened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }else {
            self.data[indexPath.section].isOpened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row == 0 else {
            
            return 64.5
        }
        return 100
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

