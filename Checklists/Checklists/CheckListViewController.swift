//
//  ViewController.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-01-29.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    let dataList = ["Walk the dog", "Brush teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"];
    var dataCheked = [true, true, true, true, true];
    
    let checkListItems: [CheckListItem] = [CheckListItem(text: "Walk the dog", checked: true),
                                           CheckListItem(text: "Brush teeth", checked: true),
                                           CheckListItem(text: "Learn iOS development", checked: true),
                                           CheckListItem(text: "Soccer practice", checked: true),
                                           CheckListItem(text: "Eat ice cream", checked: true), ];
    
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItems.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath);
        let label = cell.viewWithTag(1000) as! UILabel;
        label.text = checkListItems[indexPath.row].text;
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckMark(for: cell, at: indexPath);
        }
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    func configureCheckMark(for cell: UITableViewCell, at indexPath: IndexPath) {
        
        //checkListItems[indexPath.row].checked = !checkListItems[indexPath.row].checked;
        checkListItems[indexPath.row].toggelChecked();
        if !checkListItems[indexPath.row].checked {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
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

