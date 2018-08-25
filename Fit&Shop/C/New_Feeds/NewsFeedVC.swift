//
//  NewsFeedVC.swift
//  Fit&Shop
//
//  Created by Killva on 7/21/18.
//  Copyright © 2018 Killva. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var data = [NewsFeedsDetailsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 240
        self.tableView.rowHeight = UITableViewAutomaticDimension
        ad.isLoading()
        Post_Requests().getNewsFeedData_request(completion: { [weak self ] (rData ) in
            
            DispatchQueue.main.async {
                self?.data = rData
                ad.killLoading()
                self?.tableView.reloadData()
            }
            
        }) { (err ) in
            self.showApiErrorSms(err: err )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        cell.configCell(data: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
