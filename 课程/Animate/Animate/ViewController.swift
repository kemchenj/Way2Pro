//
//  ViewController.swift
//  Animate
//
//  Created by kemchenj on 4/19/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var Tester: UIImageView!
    
    @IBAction func Stand() {
        Tester.animationImages = loadImage("stand", count: 10)
        Tester.animationDuration = 0.3333
        Tester.animationRepeatCount = 0
        Tester.startAnimating()
    }
    @IBAction func Skills(){
        Tester.animationImages = loadImage("dazhao", count: 87)
        Tester.animationDuration = 3
        Tester.animationRepeatCount = 1
        Tester.startAnimating()
        sleep(3)
        Tester.stopAnimating()
        Stand()
    }
    
    func loadImage(skillName: String, count: Int) -> [UIImage] {
        var images = [UIImage]()
        
        for imageIndex in 1..<(count+1){
            let image = UIImage(named: "\(skillName)_\(imageIndex)")
            print(image)
            images.append(image!)
        }
        
        return images
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

