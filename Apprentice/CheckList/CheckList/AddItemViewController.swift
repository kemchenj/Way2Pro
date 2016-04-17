//
//  AddItemViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate{
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var doneButtonBar: UIBarButtonItem!
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {// 这里?的意思是可以返回nil
        return nil
    }
    // 这个函数会通知代理(Controller)哪一个row被选中, 默认会让row变灰
    // 这里实际上会被选中的row只有一个, 所以不需要做这样的事情, 直接返回nil即可让代理知道"代理不需要知道哪一个被选中"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
        // 让textField成为第一个响应的object
        // 在storyboard里把textField的return key设置为done的话, 虚拟键盘按return也会触发done
    }
    
}