//
//  File.swift
//  test
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation

class STTg: NSObject {

    var icon: String     = ""
    var title: String    = ""
    var price: String    = ""
    var buyCount: String = ""

    func tgWithDict(dict: NSDictionary) -> STTg {
        let tg = STTg()
        tg.setValuesForKeysWithDictionary(dict as! [String:AnyObject])
        return tg
    }
}