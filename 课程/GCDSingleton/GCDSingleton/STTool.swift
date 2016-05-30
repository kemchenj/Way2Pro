//
//  STTool.swift
//  GCDSingleton
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit


class STTool: NSObject{
    
    override init() {
        print("Init")
        
        super.init()
    }
    
}

extension STTool: NSCopying, NSMutableCopying {
    
    class var sharedTool : STTool {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : STTool? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = STTool()
        }
        
        return Static.instance!
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return STTool.sharedTool
    }
    
    func mutableCopyWithZone(zone: NSZone) -> AnyObject {
        return STTool.sharedTool
    }
    
//    class var sharedTool : STTool {
//        struct Static {
//            static let instance : STTool = STTool()
//        }
//        return Static.instance
//    }
//    
//    func copyWithZone(zone: NSZone) -> AnyObject {
//        return STTool.sharedTool
//    }
//    
//    func mutableCopyWithZone(zone: NSZone) -> AnyObject {
//        return STTool.sharedTool
//    }
}
