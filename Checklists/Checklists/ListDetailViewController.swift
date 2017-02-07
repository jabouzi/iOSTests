//
//  listDetailViewController.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-02-05.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController );
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding item: CheckListItem);
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing item: CheckListItem);
    
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var doneButon: UIBarButtonItem!
    
    weak var delegate:ListDetailViewControllerDelegate?
    
    var editItem: CheckListItem?;
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        itemText.becomeFirstResponder();
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = itemText.text! as NSString;
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString;
        
        doneButon.isEnabled = (newText.length > 0);
        
        return true;
    }
    
    @IBAction func done() {
        if let item = editItem {
            item.text = itemText.text!;
            delegate?.listDetailViewController(self, didFinishEditing: item);
        } else {
            delegate?.listDetailViewController(self, didFinishAdding: CheckListItem(text: itemText.text!, checked: false))
            print(itemText.text!);
        }
        //        dismiss(animated: true, completion: nil);
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self);
        //        dismiss(animated: true, completion: nil);
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemText.delegate = self;
        
        if let item = editItem {
            title = "Edit Item";
            itemText.text = item.text;
            doneButon.isEnabled = true;
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

