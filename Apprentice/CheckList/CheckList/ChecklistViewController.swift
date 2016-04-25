//
//  ViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    var checklist : Checklist!
    var items : [ChecklistItem]
    
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem) {
        let newRowIndex = items.count
        
        items.append(item)
        // add the new item to the items(Model)
        
        let indexPath  = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        // call view to refresh
        // 通知view在哪个section的哪个index插入了row
        // 然后view会自动跟controller索取数据去填充那些rows
        
        dismissViewControllerAnimated(true, completion: nil)
        
        saveCheckItems()
    }
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditItem item: ChecklistItem){
        if let index = items.indexOf(item) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                configureTextForCell(cell, withChecklistItem: item)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
        saveCheckItems()
    }
    
    // swift所有的变量都需要有初始值, 不能使空值
    // 这是一个特殊类型的函数
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        // swift语法糖
        
        super.init(coder: aDecoder)
        loadChecklistItems()
    }
    
    // 通知view某个segue将要触发了
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1. 因为代理可能不止一个，所以需要用identifier来判断是否是自己需要的那个代理
        // swift的==可以用在绝大部分数据类型上，例如string等
        if segue.identifier == "AddItem" {
            // 2. 从storyboard可以看到ChecklistViewController并不直接连AddItemViewController，中间隔着navigationBar，所以需要先获取navigationBar
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            // 3. 把AddItemViewController的代理设置为ChecklistViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            controller.delegate = self
            // 函数定义的参数列表里有any Object的话，在调用的时候就需要指定该参数的类型
            if let indexPath = tableView.indexPathForCell( sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = checklist.name
        
        let name = "Mario"
        (1...4).forEach{print("Happy Birthday " + (($0 == 3) ? "dear \(name)":"to You"))}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // view ask for data
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
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
        
        saveCheckItems()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 1. Remove the item from the data model
        items.removeAtIndex(indexPath.row)
        // 2. Delete the corresponding row from the table view
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths,withRowAnimation: .Automatic)
        
        saveCheckItems()
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else{
            label.text = ""
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        // 在UserDomainMask里搜索DocumentationDirectory
        // true 是否拓展为绝对路径？ 是
        // 返回[String]
        // 这个函数主要是为了找到用户目录
        
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
        // 在路径后面添加上文件名
        // 方法是NSString的方法，而documentDirection返回的是string，所以需要类型转换一下
        
        // Optional Way:
        // return "\(documentsDirectory())/Checklists.plist"
    }
    
    
    // Start: Data Operation
    func saveCheckItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        // Initialize receiver for data
        
        // NSKeyedArchiver knows how to encode an Array object
        // but it doesn't know anything about ChecklistItem
        // so ChecklistItem have to conform to NSCoding(Protocol)
        archiver.encodeObject(items, forKey: "ChecklistItems")
        // encode
        archiver.finishEncoding()
        // when no more values can be encode, you should call this method to finish encoding
        
        data.writeToFile(dataFilePath(), atomically: true)
        // atomically
        // true: write to the backup file first, then renamed to the path specified by "path"
        // false: directly write to the file
    }
    
    func loadChecklistItems() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiever = NSKeyedUnarchiver(forReadingWithData: data)
                items = unarchiever.decodeObjectForKey("ChecklistItems") as! [ChecklistItem]
                unarchiever.finishDecoding()
            }
        }
    }
    // End: Data Opertaion
    
}

