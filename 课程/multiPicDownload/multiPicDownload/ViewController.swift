//
//  ViewController.swift
//  multiPicDownload
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    lazy var apps : NSArray = {
        let array = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("apps", ofType: "plist")!)
        
        let tempArr = NSMutableArray()
        
        for dict in array! {
            tempArr.addObject(STApp(dict: dict as! Dictionary<String, String>))
        }
        
        return tempArr
    }()
    
    lazy var images : NSMutableDictionary = NSMutableDictionary()


}

extension ViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "app"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        let appM = self.apps[indexPath.row] as! STApp
        
        cell?.textLabel?.text = appM.name
        cell?.detailTextLabel?.text = appM.download
        
        if let image = self.images.valueForKeyPath(appM.icon!) {
            print("Use Cache")
            cell?.imageView?.image = image as? UIImage
        } else {
            let queue = NSOperationQueue()
            let operation = NSBlockOperation(block: {
                let url = NSURL(string: appM.icon!)
                let data = NSData(contentsOfURL: url!)
                let image = UIImage(data: data!)
                self.images.setValue(image, forKeyPath: appM.icon!)
                
                NSOperationQueue.mainQueue().addOperationWithBlock({ 
                    cell?.imageView?.image = image
                })
                print("下载了\(indexPath.row)行的cell的图片")
            })
            
            queue.addOperation(operation)
        }
        
        return cell!
    }
}