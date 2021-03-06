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
        super.init(coder: aDecoder);
        loadCheckListItems();
        print("Document foldr is \(documentsDirectory())");
        print("Data file path is \(dataFilePath())");
    }
    
    func loadCheckListItems() {
        let path = dataFilePath();
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data);
            checkListItems = unarchiver.decodeObject(forKey: "checkListItems") as! [CheckListItem];
            unarchiver.finishDecoding();
        }
    }
    
    func saveCheckListItems() {
        let data = NSMutableData();
        let archiver = NSKeyedArchiver(forWritingWith: data);
        archiver.encode(checkListItems, forKey: "checkListItems");
        archiver.finishEncoding();
        data.write(to: dataFilePath(), atomically: true);
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
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return paths[0];
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist");
    }

    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil);
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        addItem(item: item);
        dismiss(animated: true, completion: nil);
        saveCheckListItems();
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = checkListItems.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
        saveCheckListItems();
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
        saveCheckListItems();
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        checkListItems.remove(at: indexPath.row);
        tableView.deleteRows(at: [indexPath], with: .automatic);
        saveCheckListItems();
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

