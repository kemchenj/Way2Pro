//
//  ViewController.swift
//  downloadImage
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSThread.detachNewThreadSelector(#selector(download), toTarget: self, withObject: nil)
    }

    func download(){
        let url = NSURL(string:"https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")
        
        let data = NSData(contentsOfURL:url!)
        
        let image = UIImage(data: data!)
       
        self.performSelectorOnMainThread(#selector(showImage), withObject: image!, waitUntilDone: false)
    }
    
    func showImage(image:UIImage) {
        self.imageView.image = image;
    }
}

