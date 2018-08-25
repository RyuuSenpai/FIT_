//
//  BodyMeasureVC.swift
//  Fit&Shop
//
//  Created by admin on 5/26/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

enum Piece_By_ID  : Int  {
    case Body = 0
    case   Jacket = 1
    case   Coat
    case   Shirt
    case   Polo_Shirt
    case   T_Shirt
    case   Long_Sleeve
    
}

class Piece_Type {
    
    var name : String!
    var type : Piece_By_ID!
    
    init(name : String , type : Piece_By_ID) {
        self.name = name
        self.type = type
    }
    
}

class BodyMeasureVC: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var mainImgV: UIImageView!
    @IBOutlet weak var bodyImgV: UIImageView!
    @IBOutlet weak var bodyUnderLineV: UIView!
    @IBOutlet weak var pieceImgV: UIImageView!
    @IBOutlet weak var pieceUnderLineV: UIView!
    
    @IBOutlet weak var btnsStackView: UIStackView!
    @IBOutlet weak var measurmentTypeLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissBtn: UIButton!
    
    var selectedBtnTag =  0
    var profileData : Profile_Details_M?
    var isEditingMeasurement = false
    var pieceData : [Piece_Type] = [
        Piece_Type(name: "T-Shirt", type: .T_Shirt),
        Piece_Type(name: "Jacket", type: .Jacket),
        Piece_Type(name: "Shirt", type: .Shirt),
        Piece_Type(name: "Polo-Shirt", type: .Polo_Shirt),
        Piece_Type(name: "Long Sleeve", type: .Long_Sleeve),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if L102Language.currentAppleLanguage() == "ar" {
            self.btnsStackView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
        
        tableView.delegate = self
        tableView.dataSource  = self
        tableView.register(UINib(nibName: "NextBtnTableVCell", bundle: nil), forCellReuseIdentifier: "NextBtnTableVCell")
        tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
        
        dismissBtn.addTarget(self, action: #selector(dismissPushedView), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSelectionView(selectedBtnTag)
        dismissBtn.alpha = isEditingMeasurement ? 1 : 0
    }
    
    
    
    
    @IBAction func getMeasurmentsBtnsHandler(_ sender: UIButton) {
        guard selectedBtnTag != sender.tag else { return }
        selectedBtnTag = sender.tag
        setupSelectionView( sender.tag )
        
        if sender.tag == 0 { // By Body
            //            tableView.reloadData()
        }else { // By Piece
            //            tableView.reloadData()
        }
    }
    
    func setupSelectionView(_ tag: Int) {
        if tag != 0 {
            bodyImgV.image =   #imageLiteral(resourceName: "ic_body_unactive")
            bodyUnderLineV.backgroundColor =  .clear
            pieceImgV.image =   #imageLiteral(resourceName: "ic_pices_active_")
            pieceUnderLineV.backgroundColor =   .orange
            measurmentTypeLbl.text = L0A.piece.stringValue()
            bodyLbl.text  = L0A.tell_Us.stringValue()
            mainImgV.image =     #imageLiteral(resourceName: "bg_pices")
        }else {
            bodyImgV.image =   #imageLiteral(resourceName: "ic_body_active_")
            bodyUnderLineV.backgroundColor =   .orange
            pieceImgV.image =   #imageLiteral(resourceName: "ic_pices_unactive_")
            pieceUnderLineV.backgroundColor =   .clear
            measurmentTypeLbl.text = L0A.body.stringValue()
            bodyLbl.text  = L0A.piece_Mea.stringValue()
            mainImgV.image =   #imageLiteral(resourceName: "bg_body")
        }
        tableView.reloadData()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedBtnTag == 0 {
            return 1
        }else {
            return pieceData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedBtnTag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NextBtnTableVCell", for: indexPath) as! NextBtnTableVCell
            
            //            let btn = UIButton()
            //                btn.imageView?.image = #imageLiteral(resourceName: "btn_")
            //            btn.translatesAutoresizingMaskIntoConstraints = false
            //            btn.widthAnchor.constraint(equalTo: cell.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
            //            btn.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            //            btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
            ////            btn.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
            //            btn.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
            //
            //            cell.addSubview(btn)
            
            cell.selectionStyle = .none
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            cell.sizesStackView.alpha = 0
            cell.nameLbl.text = "   " + pieceData[indexPath.row ].name
            //            guard let data = selectedShop?.fittedClothesData else { return cell }
            //            cell.configCell(data: data[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let vi = UIView()
        vi.backgroundColor = .clear
        return vi
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BodyMeasurementVC" ) as! BodyMeasurementVC
        vc.profileData = self.profileData
        vc.title = selectedBtnTag != 0  ? pieceData[indexPath.row ].name : "Body Measurment"
        vc.pieceType = selectedBtnTag != 0  ? pieceData[indexPath.row  ].type : Piece_By_ID.Body
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedBtnTag == 0 {
            return 50
            
        }else {
            
            return  35
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
