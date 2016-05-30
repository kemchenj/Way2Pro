//
//  STSettingCell.swift
//  彩票
//
//  Created by kemchenj on 5/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit


class STSettingCell: UITableViewCell {
    
    var item: STSettingItem! {
        get {
            return self.item
        }
        set {
            self.item = newValue
            setupData()
            setupAcessoryView()
        }
    }
    
    lazy var switchView : UISwitch! = UISwitch()
    
    class func custom(tableView:UITableView, style:UITableViewCellStyle) -> AnyObject {
        let ID = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as! STSettingCell?
        if cell == nil {
            cell = STSettingCell(style: style, reuseIdentifier: ID)
        }
        
        return cell!
    }
    
}



// MARK: - Setup

private extension STSettingCell {
    
    func setupData() {
        self.textLabel!.text       = item.title
        self.imageView!.image      = item.icon
        self.detailTextLabel!.text = item.subTitle
    }
    
    func setupAcessoryView() {
        if item.isKindOfClass(STArrowItem) {
            self.accessoryType = .DisclosureIndicator
        } else if item.isKindOfClass(STSwitchItem) {
            self.accessoryView = self.switchView
        } else {
            self.accessoryView = nil
            self.accessoryType = .None
        }
    }
    
}
