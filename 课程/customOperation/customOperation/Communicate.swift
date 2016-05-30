//
//  Communicate.swift
//  customOperation
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class Communicate: NSOperation {

    override func main() {
        let queue = NSOperationQueue()
        
        let download = NSBlockOperation { 
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
            
            let data = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: data!)
            
            print("download --- \(NSThread.currentThread())")
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
            })
        }
    }
    
}
