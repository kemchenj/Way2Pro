//
//  STOperation.swift
//  customOperation
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class STOperation: NSOperation {
    
    override func main() {
        
        for i in 0 ..< 10000 {
            print("download1 --- \(i) --- \(NSThread.currentThread())")
        }
        
        print("-----")
        
        if self.cancelled {
            return
        }
        
        for i in 0 ..< 10000 {
            print("download2 --- \(i) --- \(NSThread.currentThread())")
        }
        
        print("-----")
        
        if self.cancelled {
            return
        }
        
        for i in 0 ..< 10000 {
            print("download3 --- \(i) --- \(NSThread.currentThread())")
        }
        
        print("-----")
        
        if self.cancelled {
            return
        }
        
        for i in 0 ..< 10000 {
            print("download4 --- \(i) --- \(NSThread.currentThread())")
        }
        
        print("-----")
        
        if self.cancelled {
            return
        }
        
    }

}
