//
//  ViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items : [ChecklistItem]
    
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text    = "I am a new row"
        item.checked = false
        // init a new item
        
        items.append(item)
        // add the new item to the items(Model)
        
        let indexPath  = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        // call view to refresh
        // 通知view在哪个section的哪个index插入了row
        // 然后view会自动跟controller索取数据去填充那些rows
    }
    
    // swift所有的变量都需要有初始值, 不能使空值
    // 这是一个特殊类型的函数
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        // swift语法糖
        
        let row0item     = ChecklistItem()
        // alloc
        row0item.text    = "Walk the dog"
        row0item.checked = false
        // initialize
        items.append(row0item)
        // append it to items

        let row1item     = ChecklistItem()
        row1item.text    = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)

        let row2item     = ChecklistItem()
        row2item.text    = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)

        let row3item     = ChecklistItem()
        row3item.text    = "Soccer practice"
        row3item.checked = false
        items.append(row3item)

        let row4item     = ChecklistItem()
        row4item.text    = "Eat ice cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // 重载
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier( "ChecklistItem", forIndexPath: indexPath)

        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        return cell
    }
    
    // check or uncheck
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 1
        items.removeAtIndex(indexPath.row)
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths,withRowAnimation: .Automatic)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
}

