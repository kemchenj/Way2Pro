//
//  STBaseSettingViewController.swift
//  彩票
//
//  Created by kemchenj on 5/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit



// MARK: - Class

class STBaseSettingViewController: UITableViewController {
    
    lazy var groups: NSMutableArray! = NSMutableArray()
    
}



// MARK: - Property

private extension STBaseSettingViewController {
    
    
    
}



// MARK: - UIView

extension STBaseSettingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}



// MARK: - TableView

extension STBaseSettingViewController {
    
    // MARK: + DataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return groups.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = groups[section] as! STGroupItem
        
        return (group.items!.count)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = STSettingCell.custom(tableView, style:.Value1) as! STSettingCell
        
        let group = self.groups[indexPath.section] as! STGroupItem
        
        cell.item = group.items![indexPath.row] as! STSettingItem
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = groups[section] as! STGroupItem
        
        return group.headerTitle
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let group = groups[section] as! STGroupItem
        
        return group.footerTitle
    }
    
    
    // MARK: + Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let group = groups[indexPath.section] as! STGroupItem
        
        let item = group.items![indexPath.row] as! STSettingItem
        
        if let block = item.operationBlock {
            block(indexPath: indexPath)
            return
        }
        
        if item.isKindOfClass(STArrowItem) {
            let arrowItem = item as! STArrowItem
            
            if arrowItem.descVcClass == nil {
                return
            }
            
            let tempClass = arrowItem.descVcClass!.self
            
            let vc = tempClass()
            
            
        }
    }
}









