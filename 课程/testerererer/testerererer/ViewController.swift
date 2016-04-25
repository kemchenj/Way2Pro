//
//  ViewController.swift
//  testerererer
//
//  Created by kemchenj on 4/19/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Tester: UIImageView!
    
    @IBAction func Stand() {
        Tester.animationImages = loadImage("stand", count: 10)
        Tester.animationDuration = 0.5
        Tester.animationRepeatCount = 0
        Tester.startAnimating()
    }
    @IBAction func Skills(){
        Tester.animationImages = loadImage("dazhao", count: 87)
        Tester.animationDuration = 5.5
        Tester.animationRepeatCount = 0
        Tester.startAnimating()
        Tester.performSelector(#selector(self.Stand), withObject: nil, afterDelay: 5.5)
    }
    
    func loadImage(skillName: String, count: Int) -> [UIImage] {
        var images = [UIImage]()
        
        for imageIndex in 1..<(count+1){
            print(1)

            let image = UIImage(named: "\(skillName)_\(imageIndex)")
            images.append(image!)
        }
        
        return images
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Stand()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

