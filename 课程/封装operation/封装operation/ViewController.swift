//
//  ViewController.swift
//  封装operation
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.blockOperation()
//        self.invocationOperation()
    }
    
    func blockOperation() {
        let op1 = NSBlockOperation.init {
            print("1---\(NSThread.currentThread())")
        }
        let op2 = NSBlockOperation.init {
            print("2---\(NSThread.currentThread())")
        }
        let op3 = NSBlockOperation.init {
            print("3---\(NSThread.currentThread())")
        }
        
        op3.addExecutionBlock {
            print("4---\(NSThread.currentThread())")
        }
        op3.addExecutionBlock { 
            print("5---\(NSThread.currentThread())")
        }
        
        op1.start()
        op2.start()
        op3.start()
        
        print("--------")
    }

    func invocationOperation() {
    }

}

