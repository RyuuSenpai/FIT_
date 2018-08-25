//
//  BodyMeasurementCell.swift
//  Fit&Shop
//
//  Created by Killva on 5/7/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

class BodyMeasurementCell: UITableViewCell , UITextFieldDelegate{

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var textFOL: UITextField!
    
    weak var classDelegate : BodyMeasurementVC?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textFOL.delegate = self
//        hideKeyboardWhenTapped()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageV.image = nil
    }
    func configCell(data : BodyM_Model)
    {
        imageV.image = data.image
        titleLbl.text = data.title
        bodyLbl.text = data.body
        
    }
    
    
//    func hideKeyboardWhenTapped() {
//
//        let tap  = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
//        tap.cancelsTouchesInView = false
//        self.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyBoard() {
//        self.endEditing(true)
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let txt =  textField.text  ,let measur = Double(txt) {
            let x = SavedMesurments(title: titleLbl.text!, measure: measur)
            classDelegate?.selectionArr[self.tag] =  x 
        }
    }
    
}

struct BodyM_Model {
    
    var title : String!
    var body : String!
    var image : UIImage!
    
}

struct SavedMesurments {
    var title : String!
    var measure : Double!
}
