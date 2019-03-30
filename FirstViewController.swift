//
//  FirstViewController.swift
//  复习2
//
//  Created by 方瑾 on 2019/2/2.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstTableview: UITableView!
    var foodDetails: (cailiao:[String],zuofa: String) = ([],"")
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTableview.delegate = self
        firstTableview.dataSource = self
        
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
extension FirstViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodDetails.cailiao.count + 1
    }//几行
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                let cell = UITableViewCell()
//                if indexPath.row % 2 == 0 {
//                    cell.textLabel?.text = "Hello"
//                } else {
//                    cell.textLabel?.text = "byebye"
//                }
//                return cell
//            }//每行显示什么东西
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableViewCell
        if indexPath.row == foodDetails.cailiao.count {
            cell.formLabel.text = "做法"
            cell.foodLabel.text = foodDetails.zuofa
        } else if indexPath.row == 0 {
            cell.formLabel.text = "材料"
            cell.foodLabel.text = foodDetails.cailiao[0]
        } else {
            cell.formLabel.text = ""
            cell.foodLabel.text = foodDetails.cailiao[indexPath.row]
        }
    
        cell.foodLabel.text = "肉"
        return cell
    }
}
