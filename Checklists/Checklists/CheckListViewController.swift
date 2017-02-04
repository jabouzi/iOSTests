//
//  ViewController.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-01-29.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController, ItemDetailViewControllerDelegate {
    
//    let dataList = ["Walk the dog", "Brush teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"];
//    var dataCheked = [true, true, true, true, true];
    var checkListItems: [CheckListItem];
    
    required init?(coder aDecoder: NSCoder) {
//        checkListItems = [CheckListItem(text: "Walk the dog", checked: true),
//                                               CheckListItem(text: "Brush teeth", checked: true),
//                                               CheckListItem(text: "Learn iOS development", checked: true),
//                                               CheckListItem(text: "Soccer practice", checked: true),
//                                               CheckListItem(text: "Eat ice cream", checked: true), ];
        checkListItems = [CheckListItem]();
        
        let row0item = CheckListItem(text: "Walk the dog", checked: false)
        checkListItems.append(row0item)
        
        let row1item = CheckListItem(text:  "Brush my teeth", checked: false)
         checkListItems.append(row1item)
        
        let row2item = CheckListItem(text: "Learn iOS development", checked: false)
        checkListItems.append(row2item)
        
        let row3item = CheckListItem(text: "Soccer practice", checked: false)
        checkListItems.append(row3item)
        
        let row4item = CheckListItem(text: "Eat ice cream", checked: false)
        checkListItems.append(row4item)
        
//        checkListItems = [CheckListItem]();
        
//        let row0item = CheckListItem()
//        row0item.text = "Walk the dog"
//        row0item.checked = false
//        checkListItems.append(row0item)
//        
//        let row1item = CheckListItem()
//        row1item.text = "Brush my teeth"
//        row1item.checked = true
//        checkListItems.append(row1item)
//        
//        let row2item = CheckListItem()
//        row2item.text = "Learn iOS development"
//        row2item.checked = true
//        checkListItems.append(row2item)
//        
//        let row3item = CheckListItem()
//        row3item.text = "Soccer practice"
//        row3item.checked = false
//        checkListItems.append(row3item)
//        
//        let row4item = CheckListItem()
//        row4item.text = "Eat ice cream"
//        row4item.checked = true
//        checkListItems.append(row4item)

        super.init(coder: aDecoder)
    }
    
    
    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        
        let label =  cell.viewWithTag(1001) as! UILabel;
        if !item.checked {
            label.text = "";
        } else {
            label.text = "√";
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil);
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        addItem(item: item);
        dismiss(animated: true, completion: nil);
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = checkListItems.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func addItem(item: CheckListItem) {
        let newRowIndex = checkListItems.count;
        
        //        let item = CheckListItem(text: "I am a new row", checked: true);
        checkListItems.append(item);
        
        let indexPath = [IndexPath(row: newRowIndex, section: 0)];
        tableView.insertRows(at: indexPath, with: .automatic);
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItems.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath);
        let label = cell.viewWithTag(1000) as! UILabel;
        label.text = checkListItems[indexPath.row].text;
        configureCheckMark(for: cell, with: checkListItems[indexPath.row]);
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            checkListItems[indexPath.row].toggelChecked();
            configureCheckMark(for: cell, with: checkListItems[indexPath.row]);
        }
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        checkListItems.remove(at: indexPath.row);
        tableView.deleteRows(at: [indexPath], with: .automatic);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as! UINavigationController;
            let controller = navigationController.topViewController as! ItemDetailViewController;
            controller.delegate = self;
        } else if segue.identifier == "EditItem" {
            let navigationController = segue.destination as! UINavigationController;
            let controller = navigationController.topViewController as! ItemDetailViewController;
            controller.delegate = self;
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.editItem = checkListItems[indexPath.row];
            }
        }

    }
    
}

