//
//  ViewController.swift
//  GCD迭代
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var image1 : UIImage?
    var image2 : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        combine()
        
    }
    
    func combine() {
        
        let group = dispatch_group_create()
        let queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_group_async(group, queue) { 
            let url = NSURL(string: "https://www.eff.org/files/https-everywhere2.jpg")
            let imageData = NSData(contentsOfURL: url!)
            
            self.image1 = UIImage(data: imageData!)
            
            print("image1 download complete")
        }
        
        dispatch_group_async(group, queue) { 
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
            let imageData = NSData(contentsOfURL: url!)
            
            self.image2 = UIImage(data: imageData!)
            
            print("image2 download complete")
        }
        
        dispatch_group_notify(group, queue) {
            UIGraphicsBeginImageContext(CGSizeMake(100, 400))
            
            self.image1?.drawInRect(CGRectMake(0, 0, 100, 200))
            self.image2?.drawInRect(CGRectMake(0, 200, 100, 200))
            self.image1 = nil
            self.image2 = nil
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            print("1---\(NSThread.currentThread())")
            
            dispatch_async(dispatch_get_main_queue(), {
                self.imageView.image = image
            })
        }
    }
    
    func group2() {
        let group = dispatch_group_create()
        let queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT)
        
        for i in 0 ..< 6 {
            dispatch_group_enter(group)
            
            dispatch_async(queue, { 
                print("\(i) --- \(NSThread.currentThread())")
                dispatch_group_leave(group)
            })
        }
        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        
        print("-----------------")
    }
    
    func group() {
        let group = dispatch_group_create()
        let queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT)
        
        for i in 0 ..< 4 {
            dispatch_group_async(group, queue) {
                print("\(i) --- \(NSThread.currentThread())")
            }
        }
        
        dispatch_group_notify(group, queue) { 
            print("----------------")
        }
        
    }
    
    func apply() {
        for i in 0 ..< 10 {
            print("\(i) --- \(NSThread.currentThread())")
        }
        
        print("--------------")
        
        let queue = dispatch_get_global_queue(0, 0 )
        
        dispatch_apply(10, queue) { (let t) in
            print("\(t) --- \(NSThread.currentThread())")
        }
        
    }
    
}

