//
//  ViewController.swift
//  customOperation
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var queue : NSOperationQueue?
    var image1 : UIImage?
    var image2 : UIImage?

    @IBOutlet weak var imageView: UIImageView!
}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = NSOperationQueue()
        
        let download1 = NSBlockOperation {
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
            
            let data = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: data!)
            
            print("download --- \(NSThread.currentThread())")
            
            self.image1 = image
        }
        let download2 = NSBlockOperation {
            let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
            
            let data = NSData(contentsOfURL: url!)
            
            let image = UIImage(data: data!)
            
            print("download --- \(NSThread.currentThread())")
            
            self.image2 = image
        }
        download2.addObserver(self, forKeyPath: "isFinished", options: .New, context: nil)
        
        let combine = NSBlockOperation { 
            UIGraphicsBeginImageContext(CGSizeMake(200, 200))
            
            self.image1?.drawInRect(CGRectMake(0, 0, 200, 100))
            self.image2?.drawInRect(CGRectMake(0, 100, 200, 100))
            self.image1 = nil
            self.image2 = nil
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            print("combined")
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.imageView.image = image!
                print("UI reload succeed")
            })
        }
        
        combine.addDependency(download1)
        combine.addDependency(download2)
        
        
        queue.addOperation(download1)
        queue.addOperation(download2)
        queue.addOperation(combine)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        print("download2 done")
    }
}

private extension ViewController {
    
    @IBAction func start() {
    }
    
    @IBAction func cancel() {
    }
}
