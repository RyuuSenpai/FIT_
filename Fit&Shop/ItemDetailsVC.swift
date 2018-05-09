//
//  ItemDetailsVC.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var chestMeasurmentLbl: UILabel!
    @IBOutlet weak var waistMeasurmentLbl: UILabel!
    @IBOutlet weak var sizeBtnStackView: UIStackView!
    @IBOutlet weak var hipsMeasurmentLbl: UILabel!
    @IBOutlet weak var shirtLenghMeasurmentLbl: UILabel!
    @IBOutlet weak var smallBtn: UIButton!
    @IBOutlet weak var medSizeLbl: UIButton!
    @IBOutlet weak var bigSizeLbl: UIButton!

    let smallSTxt = "Small : Will be tight"
    let medTxtS = "Medium : is the best Size that will Fit"
    let largeTxtS = "Large size : will be more compfortable"
    let s = "0 cm"
    let m = "+2 cm"
    let l = "+5 cm"
    var data  :FittedClothesData!
    override func viewDidLoad() {
        super.viewDidLoad()
        seupTxt(body: largeTxtS, measur: l)

        smallBtn.setTitleColor(.white, for: .normal )
        smallBtn.backgroundColor = .orange
        // Do any additional setup after loading the view.
        pageTitle.text = title
//        bodyLbl.text = smallSTxt
    }
    @IBAction func backBtnhandler(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sizeSelectionhandler(_ sender: UIButton) {
        
        switch sender.tag {
        case 0 :
            smallBtn.setTitleColor(.white, for: .normal )
            smallBtn.backgroundColor = .orange
            
            medSizeLbl.setTitleColor(.black, for: .normal )
            medSizeLbl.backgroundColor = .clear
            bigSizeLbl.setTitleColor(.black, for: .normal )
            bigSizeLbl.backgroundColor = .clear
       
//            seupTxt(body: smallSTxt, measur: s)
        case 1 :
            medSizeLbl.setTitleColor(.white, for: .normal )
            medSizeLbl.backgroundColor = .orange
            
            smallBtn.setTitleColor(.black, for: .normal )
            smallBtn.backgroundColor = .clear
            bigSizeLbl.setTitleColor(.black, for: .normal )
            bigSizeLbl.backgroundColor = .clear
//            seupTxt(body: medTxtS, measur: m)
            
        case 2 :
            bigSizeLbl.setTitleColor(.white, for: .normal )
            bigSizeLbl.backgroundColor = .orange
            
            medSizeLbl.setTitleColor(.black, for: .normal )
            medSizeLbl.backgroundColor = .clear
            smallBtn.setTitleColor(.black, for: .normal )
            smallBtn.backgroundColor = .clear
//            seupTxt(body: largeTxtS, measur: l)
        default : break

        }
    }
    
    func seupTxt(body : String , measur : String) {
        smallBtn.alpha = 0
        medSizeLbl.alpha = 0
        bigSizeLbl.setTitle(data.size, for: .normal)
        bigSizeLbl.backgroundColor = .orange
        bigSizeLbl.setTitleColor(.white, for: .normal )
        sizeBtnStackView.removeArrangedSubview(smallBtn)
        sizeBtnStackView.removeArrangedSubview(medSizeLbl)
        bodyLbl.text = data.desc
        chestMeasurmentLbl.text = "\(data.chest) cm"
        hipsMeasurmentLbl.text = "\(data.hips) cm"
        waistMeasurmentLbl.text = "\(data.waist) cm"
        shirtLenghMeasurmentLbl.text = "\(data.length) cm"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
