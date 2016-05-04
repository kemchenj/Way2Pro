//
//  ViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate
{
    var checklist: Checklist!



    // MARK - UIView

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = checklist.name
    }



    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    {
        let newRowIndex = checklist.items.count

        checklist.items.append(item)
        // add the new item to the items(Model)

        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        // call view to refresh
        // 通知view在哪个section的哪个index插入了row
        // 然后view会自动跟controller索取数据去填充那些rows

        dismissViewControllerAnimated(true, completion: nil)
    }

    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditItem item: ChecklistItem)
    {
        if let index = checklist.items.indexOf(item) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                configureTextForCell(cell, withChecklistItem: item)
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

    // 通知view某个segue将要触发了
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // 1. 因为代理可能不止一个，所以需要用identifier来判断是否是自己需要的那个代理
        // swift的==可以用在绝大部分数据类型上，例如string等
        if segue.identifier == "AddItem" {
            // 2. 从storyboard可以看到ChecklistViewController并不直接连AddItemViewController，中间隔着navigationBar，所以需要先获取navigationBar
            let navigationController = segue.destinationViewController as! UINavigationController
            navigationController.title = "Add Item"
            let controller = navigationController.topViewController as! ItemDetailViewController
            // 3. 把AddItemViewController的代理设置为ChecklistViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ItemDetailViewController
            navigationController.title = "Edit Item"
            controller.delegate = self
            // 函数定义的参数列表里有any Object的话，在调用的时候就需要指定该参数的类型
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }



    // view ask for data
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return checklist.items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)

        let item = checklist.items[indexPath.row]

        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        return cell
    }

    // check or uncheck
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = checklist.items[indexPath.row]
            item.toggleChecked()

            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        // 1. Remove the item from the data model
        checklist.items.removeAtIndex(indexPath.row)
        // 2. Delete the corresponding row from the table view
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)

    }

    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem)
    {
        let label = cell.viewWithTag(1001) as! UILabel

        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }

    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem)
    {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}

