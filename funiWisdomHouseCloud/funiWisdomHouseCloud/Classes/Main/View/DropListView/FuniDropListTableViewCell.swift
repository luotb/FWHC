//
//  FuniDropListTableViewCell.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/29.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class FuniDropListTableViewCell: BaseCell {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    var lastSelValue:String?
    
    var configInfoObj:FuniConfigInfo = FuniConfigInfo() {
        willSet{
            self.titleLabel.text = newValue.title!
            if self.lastSelValue == newValue.title {
                self.iconImageView.image = UIImage(named: "selected")
            } else{
                self.iconImageView.image = UIImage(named: "unSelect")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
