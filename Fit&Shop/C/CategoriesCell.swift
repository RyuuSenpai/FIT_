//
//  CategoriesCell.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabelX!
    @IBOutlet weak var sizeLbl1: UILabelX!
    @IBOutlet weak var sizeLbl2: UILabelX!
    @IBOutlet weak var sizesStackView: UIStackView!
    @IBOutlet weak var backBtnImgV: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sizeLbl1.alpha = 0
        sizeLbl2.alpha = 0
        if L102Language.currentAppleLanguage() == "ar" {
            self.backBtnImgV.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
    }
    
   
    
    
    func configCell(data : Piece_Data) {
        
        nameLbl.text = data.piece_name
//        sizeLbl.text = data.size
        guard   data.sizes.count != 0  else {
            
            self.sizesStackView.alpha = 0
            return
        }
        if  data.sizes.count == 3   {
            sizeLbl.alpha = 1
            sizeLbl1.alpha = 1
            sizeLbl2.alpha = 1

            sizeLbl.text = data.sizes[0].size
            sizeLbl1.text = data.sizes[1].size
            sizeLbl2.text = data.sizes[2].size

        }else if  data.sizes.count == 2   {
            sizeLbl.alpha = 1
            sizeLbl1.alpha = 1
            sizeLbl2.alpha = 0
            
            sizeLbl.text = data.sizes[0].size
            sizeLbl1.text = data.sizes[1].size
 
        }else if  data.sizes.count == 1   {
            sizeLbl.alpha = 1
            sizeLbl1.alpha = 0
            sizeLbl2.alpha = 0
            
            sizeLbl.text = data.sizes[0].size
            
        }else {
            sizeLbl.alpha = 1
            sizeLbl1.alpha = 1
            sizeLbl2.alpha = 1
            
            sizeLbl.text = data.sizes[0].size
            sizeLbl1.text = data.sizes[1].size
            sizeLbl2.text = data.sizes[2].size
            
        }
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
