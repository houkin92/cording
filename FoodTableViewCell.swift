//
//  FoodTableViewCell.swift
//  复习2
//
//  Created by 方瑾 on 2019/2/2.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var formLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
