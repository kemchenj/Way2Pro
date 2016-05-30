//
//  ViewController.swift
//  BasicGCD
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//        test()
//        asyncConcurrent()
//        asyncSerial()
//        syncMain()
//        test()
        
//        download()
        
        barrier()
    }
    
    func barrier() {
        let queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_async(queue) {
            print("download1---\(NSThread.mainThread())")
        }
        
        dispatch_async(queue) { 
            print("download2---\(NSThread.mainThread())")
        }
        
        dispatch_barrier_async(queue) { 
            print("+++++++++++")
        }
        
        dispatch_async(queue) { 
            print("download3---\(NSThread.mainThread())")
        }
        
        dispatch_async(queue) { 
            print("download4---\(NSThread.mainThread())")
        }
        
    }
    
    func download() {
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            print("\(NSThread .mainThread())")
            
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
            
            let data = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: data!)
        
            dispatch_sync(dispatch_get_main_queue(), { 
                self.imageView.image = image
                
                print("\(NSThread.mainThread())")
            })
        }
    }
    
    func test() {
        let queue1 = dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL)
        let queue2 = dispatch_queue_create("2", DISPATCH_QUEUE_SERIAL)
        let queue3 = dispatch_queue_create("3", DISPATCH_QUEUE_SERIAL)
        
        dispatch_async(queue1) { 
            print("1---\(NSThread.currentThread())")
        }
        
        dispatch_async(queue2) {
            print("2---\(NSThread.currentThread())")
        }
        
        dispatch_async(queue3) {
            print("3.1---\(NSThread.currentThread())")
        }
        dispatch_async(queue3) {
            print("3.2---\(NSThread.currentThread())")
        }
        dispatch_async(queue3) {
            print("3.3---\(NSThread.currentThread())")
        }
        
        print("------")
    }
    
    func syncMain() {
        let queue = dispatch_get_main_queue()
        
        print("start")
        for i in 0 ..< 4 {
            dispatch_sync(queue, {
                print("\(i)----\(NSThread.currentThread())")
            })
        }
        print("end")
    }
    
    func syncConcurrent() {
        let queue = dispatch_get_global_queue(0, 0)
        
        for i in 0 ..< 4 {
            dispatch_async(queue, { 
                print("\(i)----\(NSThread.currentThread())")
            })
        }
        
    }
    
    func asyncConcurrent(){
        let queue = dispatch_get_global_queue(0, 0)
        
        for i in 0 ..< 4 {
            dispatch_async(queue, { 
                print("\(i)----\(NSThread.currentThread())")
            })
        }
    }
    
    func asyncSerial() {
        let queue = dispatch_get_global_queue(0, 0)
        
        for i in 0 ..< 4 {
            dispatch_sync(queue, {
                print("\(i)----\(NSThread.currentThread())")
            })
        }
    }
    
}

