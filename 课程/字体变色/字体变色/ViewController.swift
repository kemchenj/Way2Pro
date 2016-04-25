//
//  ViewController.swift
//  字体变色
//
//  Created by kemchenj on 4/18/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelWantToChange: UILabel!
    @IBAction func changeToRed() {
        labelWantToChange.textColor = UIColor.redColor()
    }
    @IBAction func changeToBlue() {
        labelWantToChange.textColor = UIColor.blueColor()
    }
    @IBAction func changeToBlack() {
        labelWantToChange.textColor = UIColor.blackColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

