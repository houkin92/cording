//
//  MainViewController.swift
//  复习2
//
//  Created by 方瑾 on 2019/2/2.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var changePageControl: UIPageControl!
    
    @IBOutlet weak var foodNameLabel: UILabel!
    var foodInfos : [(foodName:String,imageName:String,cailiao:[String],zuofa:String)] = [("干锅田鸡","干锅田鸡",["田鸡","辣椒"],"干锅"),
                                                                                          ("水煮活鱼","水煮活鱼",["草鱼","辣椒"],"水煮"),
                                                                                          ("泡椒田鸡","泡椒田鸡",["田鸡","泡椒"],"干锅")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        foodImageView.image = UIImage(named: foodInfos[0].imageName)
//        foodNameLabel.text = foodInfos[0].foodName
        
        //调用图片和Label 的设置方法
        setupImage(num: changePageControl.currentPage)
        changePageControl.addTarget(self, action: #selector(changeImage), for:.valueChanged)
        //UITapGestureRecognizer表示手势的交互
        //创建一个手势交互
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImage))
//        tapGestureRecognizer.delegate = self
        //将手势交互添加到目标控件（Imageview）上
//        foodImageView.addGestureRecognizer(tapGestureRecognizer)
        self.view.addGestureRecognizer(tapGestureRecognizer)
        //允许用户用户与目标控件进行交互
        foodImageView.isUserInteractionEnabled = true
       

       
    }
    @objc func changeImage(_ sender:UIPageControl) {
        //调用图片和Label 的设置方法
        setupImage(num: sender.currentPage)
        
    }
    @objc func tapImage(_ sender:UITapGestureRecognizer) {
        performSegue(withIdentifier: "toFirstSegue", sender: nil)
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirstSegue" {
            let nextPageVC = segue.destination as! FirstViewController
            nextPageVC.foodDetails = (foodInfos[changePageControl.currentPage].cailiao,foodInfos[changePageControl.currentPage].zuofa)
            
    }
        
    }
    //根据pageControl设置图片和label
    func setupImage(num:Int) {
        foodImageView.image = UIImage(named: foodInfos[num].imageName)
        foodNameLabel.text = foodInfos[num].foodName
    }
   

}
extension MainViewController : UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view != foodImageView {
            return true
        } else {
            return false
        }
    }
}
