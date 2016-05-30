//
//  DepedencyOperation.swift
//  customOperation
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class DepedencyOperation: NSOperation {

    override func main() {
        let queue1 = NSOperationQueue()
        let queue2 = NSOperationQueue()
        
        let op1 = NSBlockOperation { 
            print("1 --- \(NSThread.currentThread())")
        }
        
        let op2 = NSBlockOperation {
            for i in 0 ..< 10 {
                print("2 --- \(i) --- \(NSThread.currentThread())")
            }
        }
        
        let op3 = NSBlockOperation {
            print("3 --- \(NSThread.currentThread())")
        }
        op3.addExecutionBlock {
            print("下载完毕")
        }
        
        let op4 = NSBlockOperation { 
            print("4 --- \(NSThread.currentThread())")
        }
        
        op1.addDependency(op2)
        op2.addDependency(op1)
        
        queue1.addOperation(op1)
        queue1.addOperation(op2)
        queue1.addOperation(op3)
        queue2.addOperation(op4)
    }
    
}
