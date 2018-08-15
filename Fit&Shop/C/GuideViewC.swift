//
//  GuideViewC.swift
//  ProjectA
//
//  Created by admin on 2/15/18.
//  Copyright © 2018 X. All rights reserved.
//

import UIKit

class GuideViewC: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
     @IBOutlet weak var pageC: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    
    var pageNumber : CGFloat =  0.0 // L102Language.currentAppleLanguage() != "ar" ? 0.0 : 3

   private  class PagerDataC {
        var title : String!
        var body : String!
        init(title : String , body : String) {
            self.title = title
            self.body = body
        }
    }
    
    private let dict : [PagerDataC] = [
    PagerDataC(title: "AWESOME DEALS Waiting for You.", body: "Only one step and you will never miss a deal let's fit you"),
    PagerDataC(title: "Perfect Fit Guaranteed", body: "To Wear Clothes With a Perfect Fit is a Confidence Boost Everyone Should Experience."),
    PagerDataC(title: "One Size Only _ Yours", body: "Get instand Adccess to Your Size on your Favorite Brands."),
    PagerDataC(title: "Measure Once Order Forever.", body: "Engage 5min of your Time and setup a Measurement profile.")
    
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self

        let imageArray = [image1,image2,image3,image4]
        
        for (i,img) in imageArray.enumerated() {
            
            img!.image = UIImage(named:"pager\(i)") // L102Language.currentAppleLanguage() == "ar"  ? UIImage(named: "AR (\(i + 1))") : UIImage(named: "EN (\(i + 1))")
            img!.contentMode = .scaleAspectFill
 
        }
        // Do any additional setup after loading the view.
        
        self.pageC.numberOfPages = 4
        self.pageC.currentPage = 0
        
        
        if L102Language.currentAppleLanguage() == "ar" {
 
            pageC.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            
        }
    }

    @IBAction func setupNewProfileHandler(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login___RegisterationVC")
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func iHaveProfileHandler(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login___RegisterationVC")
        self.present(vc, animated: true, completion: nil)

    }
    

    @IBAction func dismissHandler(_ sender: UIButton) {
        UserDefaults.standard.setValue(true, forKey: "didShowTutorial")
        self.dismiss(animated: true, completion: nil   )
     }

    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageC.currentPage = Int(currentPage);
        let pageNum = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        pageNumber = pageNum
        // Change the text accordingly
        titleLbl.text = dict[Int(currentPage)].title
        bodyLbl.text = dict[Int(currentPage)].body

//        if Int(currentPage) == 0{
//            //            textView.text = "Sweettutos.com is your blog of choice for Mobile tutorials"
//        }else if Int(currentPage) == 1{
//            //            textView.text = "I write mobile tutorials mainly targeting iOS"
//        }else if Int(currentPage) == 2{
//            //            textView.text = "And sometimes I write games tutorials about Unity"
//        }else{
//            //            textView.text = "Keep visiting sweettutos.com for new coming tutorials, and don't forget to subscribe to be notified by email :)"
//            // Show the "Let's Start" button in the last slide (with a fade in animation)                     UIView.animate(withDuration: 1.0, animations: { () -> Void in
//            //            self.startButton.alpha = 1.0
//            //        })
//        }
    }

}
