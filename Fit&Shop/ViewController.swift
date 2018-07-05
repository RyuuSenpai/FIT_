//
//  ViewController.swift
//  Fit&Shop
//
//  Created by Killva on 5/6/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit
import SSSlider

class ViewController: UIViewController {
    
    @IBOutlet weak var horizontalSlider: SSSlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // for horizontal
        
        
        
    
    }

    @IBAction func didTouchChangeValue(_ sender: Any) {
        let value: CGFloat = CGFloat(Int(arc4random_uniform(101))) / 100.0
        horizontalSlider.setValue(percent: 0.5, animated: true)
       }

}

