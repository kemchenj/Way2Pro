//
//  ViewController.swift
//  test
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var tableView: tgViewCell!
    
    var tgs: [tgModels]?
    
    override func loadView() {
        super.loadView()
        
        loadData()
    }
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 71
    }
    
    func loadData() {
        let path = NSBundle.mainBundle().pathForResource("tgs", ofType: "plist")
        let dict = NSArray(contentsOfFile: path!) as! [[String: AnyObject]]
        tgs = dict.map{tgModels(dict: $0)}
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tgs?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! tgViewCell
        cell.tgs = tgs![indexPath.row]
        return cell
    }
    
}

