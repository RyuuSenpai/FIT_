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

    @IBOutlet weak var a_lineV: UIView!
    @IBOutlet weak var b_lineV: UIView!
    @IBOutlet weak var c_lineV: UIView!
    @IBOutlet weak var d_lineV: UIView!
    @IBOutlet weak var a_lineCircle: UIView!
    @IBOutlet weak var b_lineCircle: UIView!
    @IBOutlet weak var c_lineCircle: UIView!
    @IBOutlet weak var d_lineCircle: UIView!

    //    let smallSTxt = "Small : Will be tight"
//    let medTxtS = "Medium : is the best Size that will Fit"
//    let largeTxtS = "Large size : will be more compfortable"
//    let s = "0 cm"
//    let m = "+2 cm"
//    let l = "+5 cm"
    var data  :Piece_Data!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSizesBtns() 
         if data.sizes.count >= 1 {
            seupTxt(data: data.sizes[0],medSizeLbl)
        }
        
        // Do any additional setup after loading the view.
        pageTitle.text = title
//        bodyLbl.text = smallSTxt
        
        
        
    }
    
    
    func setupSizesBtns() {
        if  data.sizes.count == 2   {
            bigSizeLbl.setTitle(data.sizes[1].size, for: .normal)
            medSizeLbl.setTitle(data.sizes[0].size, for: .normal)
            sizeBtnStackView.removeArrangedSubview(smallBtn)
            smallBtn.alpha = 0
        }else if  data.sizes.count == 1   {
            medSizeLbl.setTitle(data.sizes[0].size, for: .normal)
            sizeBtnStackView.removeArrangedSubview(bigSizeLbl)
            sizeBtnStackView.removeArrangedSubview(smallBtn)
            smallBtn.alpha = 0
            bigSizeLbl.alpha = 0
        }else if  data.sizes.count == 3   {
            bigSizeLbl.setTitle(data.sizes[1].size, for: .normal)
            medSizeLbl.setTitle(data.sizes[0].size, for: .normal)
            smallBtn.setTitle(data.sizes[2].size, for: .normal)
         }
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
            if data.sizes.count >= 3 {
                seupTxt(data: data.sizes[2],sender)
            }
//            seupTxt(body: smallSTxt, measur: s)
        case 1 :
            medSizeLbl.setTitleColor(.white, for: .normal )
            medSizeLbl.backgroundColor = .orange
            
            smallBtn.setTitleColor(.black, for: .normal )
            smallBtn.backgroundColor = .clear
            bigSizeLbl.setTitleColor(.black, for: .normal )
            bigSizeLbl.backgroundColor = .clear
            if data.sizes.count >= 1 {
            seupTxt(data: data.sizes[0],sender)
            }
         case 2 :
            bigSizeLbl.setTitleColor(.white, for: .normal )
            bigSizeLbl.backgroundColor = .orange
            
            medSizeLbl.setTitleColor(.black, for: .normal )
            medSizeLbl.backgroundColor = .clear
            smallBtn.setTitleColor(.black, for: .normal )
            smallBtn.backgroundColor = .clear
//            seupTxt(body: largeTxtS, measur:
            if data.sizes.count >= 2 {
                seupTxt(data: data.sizes[1],sender)
            }
        default : break

        }
    }
    
    func seupTxt(data : FittedClothesData ,_ sender: UIButton) {
        sender.setTitle(data.size, for: .normal)
        sender.backgroundColor = .orange
        sender.setTitleColor(.white, for: .normal )
        bodyLbl.text = data.desc
        chestMeasurmentLbl.text = "\(data.chest) cm"
        hipsMeasurmentLbl.text = "\(data.hips) cm"
        waistMeasurmentLbl.text = "\(data.waist) cm"
        shirtLenghMeasurmentLbl.text = "\(data.length) cm"
        setupViewsColors(line: a_lineV, circleLetter: a_lineCircle, measurements: data.chest)
        setupViewsColors(line: b_lineV, circleLetter: b_lineCircle, measurements: data.waist)
        setupViewsColors(line: c_lineV, circleLetter: c_lineCircle, measurements: data.hips)
        setupViewsColors(line: d_lineV, circleLetter: d_lineCircle, measurements: data.length)

     }
    
    func setupViewsColors(line : UIView , circleLetter : UIView,measurements: Double) {
        
        if measurements 	>= 4 {
            line.alpha = 1	
            circleLetter.alpha = 1
            line.backgroundColor = .green
            circleLetter.backgroundColor = .green
        }else if measurements <= 0 {
            line.alpha = 1
            circleLetter.alpha = 1
            line.backgroundColor = .red
            circleLetter.backgroundColor = .red
        }else {
            line.alpha = 0
            circleLetter.alpha = 0
            circleLetter.clipsToBounds = true
            
        }
        
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
