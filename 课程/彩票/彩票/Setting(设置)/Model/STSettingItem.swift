//
//  STSettingItem.swift
//  彩票
//
//  Created by kemchenj on 5/25/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit

class STSettingItem: NSObject {
    
    var title : String?
    var subTitle : String?
    
    var icon  : UIImage?
    
    var operationBlock : ((indexPath: NSIndexPath)->())?
    
    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
        
        super.init()
    }
    
}