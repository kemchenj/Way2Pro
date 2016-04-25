//
//  ChecklistItem.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject, NSCoding{
    var text    = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    
    // NSCoindg Protocol
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    
        // this is the method for unfreezing the objects from the file
    required init?(coder aDecoder: NSCoder){
        text    = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    override init() {
        super.init()
    }
    // end
}