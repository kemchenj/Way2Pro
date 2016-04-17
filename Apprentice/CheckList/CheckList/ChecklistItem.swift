//
//  ChecklistItem.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

class ChecklistItem{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
}