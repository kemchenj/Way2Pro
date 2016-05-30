//
//  Checklist.swift
//  CheckList
//
//  Created by kemchenj on 4/19/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class Checklist: NSObject, NSCoding
{
    var name  = ""
    var items = [ChecklistItem]()
    var iconName: String

    
    
    convenience init(name: String) {
        self.init(name: name, iconName: "No Icon")
    }
    
    init(name: String, iconName: String) {
        self.name     = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int{
//        var count = 0
//        for item in items where !item.checked {
//            count += 1
//        }
//        
//        return count
        
        return items.reduce(0) { cnt, item in cnt + (item.checked ? 0 : 1) }
        // cnt是参数的名字, 也就是0, 可以随意更改
        // item in items
        // cnt + (item.checked ? 0 : 1)
    }
    
    
    
    
    // MARK: - NSCoding Protocol
    
    required init?(coder aDecoder: NSCoder) {
        name     = aDecoder.decodeObjectForKey("Name") as! String
        items    = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
        iconName = aDecoder.decodeObjectForKey("IconName") as! String
    }

    func encodeWithCoder(aDecoder: NSCoder) {
        aDecoder.encodeObject(name, forKey: "Name")
        aDecoder.encodeObject(items, forKey: "Items")
        aDecoder.encodeObject(iconName, forKey: "IconName")
    }
}
