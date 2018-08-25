//
//  NewsFeedCell.swift
//  Fit&Shop
//
//  Created by Killva on 7/21/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configCell(data : NewsFeedsDetailsData) {
        print("*\(data.image)*")
        if  let url = URL(string: data.image )   {
            imageV.af_setImage(
            withURL: url ,
            placeholderImage: UIImage(named: "pexels-photo-934063"),
            filter: nil,
            imageTransition: .crossDissolve(0.2)
        ) }
        titleLbl.text = data.title
        bodyLbl.text = data.body
    }

}
