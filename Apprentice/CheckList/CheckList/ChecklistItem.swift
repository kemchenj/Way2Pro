//
//  ChecklistItem.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation



class ChecklistItem: NSObject, NSCoding
{
    var text = ""
    var checked = false
    var dueDate = NSDate()
    var shouldRemind = false
    var itemID : Int
    
    
    override convenience init() {
        self.init(text: "", checked: false)
    }
    
    convenience init(text: String) {
        self.init(text: text, checked: false)
    }
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
        self.itemID = DataModel.nextChecklistItemID()
        super.init()
    }

    func toggleChecked() {
        checked = !checked
    }
    
    
    
    // MARK: - NSCoindg Protocol
    
    required init?(coder aDecoder: NSCoder) {
        text         = aDecoder.decodeObjectForKey("Text") as! String
        checked      = aDecoder.decodeBoolForKey("Checked")
        dueDate      = aDecoder.decodeObjectForKey("DueDate") as! NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID       = aDecoder.decodeIntegerForKey("ItemID")
        
        super.init()
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }
}