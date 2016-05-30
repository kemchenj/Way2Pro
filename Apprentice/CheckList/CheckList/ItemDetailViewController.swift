//
//  ItemDetailViewController.swift
//  CheckList
//
//  Created by kemchenj on 4/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

import Foundation
import UIKit



protocol ItemDetailViewControllerDelegate: class
{
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditItem item: ChecklistItem)
    func itemDetailViewController(controller: ItemDetailViewController, didFinishAddingItem item: ChecklistItem)
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
}



class ItemDetailViewController: UITableViewController, UITextFieldDelegate
{
    var itemToEdit: ChecklistItem?
    weak var delegate: ItemDetailViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var dueDateLabel: UILabel!



    // MARK: - UIView

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
        // 让textField成为第一个响应的object
        // 在storyboard里把textField的return key设置为done的话, 虚拟键盘按return也会触发done
    }



    // MARK: - Button (Navigation Bar)

    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditItem: item)
            // Optional: if delegate == nil, the sentence after "?" would not be executed
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
    }



    // MARK: - TableView Delegate
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }

    
    
    // MARK: - TextField Delegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)

        doneBarButton.enabled = (newText.length > 0)

        return true
    }

}