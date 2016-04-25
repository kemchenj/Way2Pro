//
//  ItemDetailViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate{
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    @IBAction func done() {
        if let item = itemToEdit {
            item.text    = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditItem: item)
            // Optional: if delegate == nil, the sentence after "?" would not be executed
        } else {
            let item = ChecklistItem()
            item.text    = textField.text!
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? { // 这里?的意思是可以返回nil
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
    
    // optional method
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        // if newText.length > 0 {
        //     doneBarButton.enabled = true
        // } else {
        //     doneBarButton.enabled = false
        // }
        doneBarButton.enabled = (newText.length > 0)
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title          = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }
    
}