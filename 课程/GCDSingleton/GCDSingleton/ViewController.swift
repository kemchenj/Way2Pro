//
//  ViewController.swift
//  GCDSingleton
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tool : STTool?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leiinit(){
        self.tool = STTool()
    }

    @IBAction func copyyyy(){
        let tool = self.tool?.copy()
        self.tool = tool as? STTool
        
        print("\(self.tool)")
    }
    @IBAction func shared(){
        self.tool = STTool.sharedTool
        print("\(self.tool)")
    }
}

