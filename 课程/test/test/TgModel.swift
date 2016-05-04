//
//  STTgModel.swift
//  test
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

class tgModels: NSObject {
    var icon : String?
    var title : String?
    var price : String?
    var buyCount : String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
}