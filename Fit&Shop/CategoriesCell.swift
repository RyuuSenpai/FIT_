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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data : FittedClothesData) {
        
        nameLbl.text = data.piece
        sizeLbl.text = data.size
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
