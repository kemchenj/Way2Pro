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
    var name = ""
    var items = [ChecklistItem]()

    init(name: String) {
        self.name = name
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("Name") as! String
        items = aDecoder.decodeObjectForKey("Items") as! [ChecklistItem]
    }

    func encodeWithCoder(aDecoder: NSCoder) {
        aDecoder.encodeObject(name, forKey: "Name")
        aDecoder.encodeObject(items, forKey: "Items")
    }
}
