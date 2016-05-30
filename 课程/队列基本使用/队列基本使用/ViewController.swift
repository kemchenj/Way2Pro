//
//  ViewController.swift
//  队列基本使用
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var queue : NSOperationQueue?

}


private extension ViewController {
    
    @IBAction func start(){
        self.test()
    }
    
    @IBAction func suspend(){
        self.queue?.suspended = true
    }
    
    @IBAction func go(){
        self.queue?.suspended = false
    }
    
    @IBAction func cancel(){
        self.queue?.cancelAllOperations()
    }
    
    func test() {
        let queue = NSOperationQueue()
        
        queue.maxConcurrentOperationCount = 1
        
        let op1 = NSBlockOperation {
            for i in 0 ..< 10000 {
                print("download1 ---- \(i) ---- \(NSThread.currentThread())")
            }
        }
        let op2 = NSBlockOperation {
            for i in 0 ..< 10000 {
                print("download2 ---- \(i) ---- \(NSThread.currentThread())")
            }
        }
        let op3 = NSBlockOperation {
            for i in 0 ..< 10000 {
                print("download3 ---- \(i) ---- \(NSThread.currentThread())")
            }
        }
        let op4 = NSBlockOperation {
            for i in 0 ..< 10000 {
                print("download4 ---- \(i) ---- \(NSThread.currentThread())")
            }
        }
        
        queue.addOperation(op1)
        queue.addOperation(op2)
        queue.addOperation(op3)
        queue.addOperation(op4)
        
        self.queue = queue
    }
    
}