//
//  STApp.swift
//  multiPicDownload
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class STApp: NSObject {
    
    var name : String?
    var icon : String?
    var download : String?
    
    init(dict: Dictionary<String, String>) {
        super.init()
        self.setValuesForKeysWithDictionary(dict)
    }

}
