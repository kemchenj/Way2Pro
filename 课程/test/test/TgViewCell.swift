//
//  TgViewCell.swift
//  test
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//


import UIKit

class tgViewCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var buyCount: UILabel!
    
    override func layoutSubviews() {
        
    }
    
    var tgs: tgModels?{
        didSet{
            icon.image    = UIImage(named: tgs!.icon!)
            title.text    = tgs?.title
            money.text    = tgs?.price
            buyCount.text = tgs?.buyCount
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}