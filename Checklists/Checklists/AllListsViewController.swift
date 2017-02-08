//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-02-04.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {
    
    //    let dataList = ["Walk the dog", "Brush teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"];
    //    var dataCheked = [true, true, true, true, true];
    var checkList: [CheckList];
    
    required init?(coder aDecoder: NSCoder) {
        //        checkListItems = [CheckListItem(text: "Walk the dog", checked: true),
        //                                               CheckListItem(text: "Brush teeth", checked: true),
        //                                               CheckListItem(text: "Learn iOS development", checked: true),
        //                                               CheckListItem(text: "Soccer practice", checked: true),
        //                                               CheckListItem(text: "Eat ice cream", checked: true), ];
        checkList = [CheckList]();
        super.init(coder: aDecoder);
        loadCheckList();
        print("Document foldr is \(documentsDirectory())");
        print("Data file path is \(dataFilePath())");
    }
    
    func loadCheckList() {
        let path = dataFilePath();
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data);
            checkList = unarchiver.decodeObject(forKey: "checkList") as! [CheckList];
            unarchiver.finishDecoding();
        }
    }
    
    func saveCheckList() {
        let data = NSMutableData();
        let archiver = NSKeyedArchiver(forWritingWith: data);
        archiver.encode(checkList, forKey: "checkList");
        archiver.finishEncoding();
        data.write(to: dataFilePath(), atomically: true);
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: CheckList) {
        
        //let label =  cell.viewWithTag(1003) as! UILabel;
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckList) {
        //let label = cell.viewWithTag(1002) as! UILabel
        //label.text = item.text
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask);
        return paths[0];
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist");
    }
    
    
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        dismiss(animated: true, completion: nil);
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding item: CheckList) {
        addList(item: item);
        dismiss(animated: true, completion: nil);
        saveCheckList();
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing item: CheckList) {
        if let index = checkList.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        dismiss(animated: true, completion: nil)
        saveCheckList();
    }
    
    func addList(item: CheckList) {
        let newRowIndex = checkList.count;
        
        //        let item = CheckListItem(text: "I am a new row", checked: true);
        checkList.append(item);
        
        let indexPath = [IndexPath(row: newRowIndex, section: 0)];
        tableView.insertRows(at: indexPath, with: .automatic);
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
        if segue.identifier == "AddList" {
            let navigationController = segue.destination as! UINavigationController;
            let controller = navigationController.topViewController as! ListDetailViewController;
            controller.delegate = self;
        } else if segue.identifier == "EditList" {
            let navigationController = segue.destination as! UINavigationController;
            let controller = navigationController.topViewController as! ListDetailViewController;
            controller.delegate = self;
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.editItem = checkList[indexPath.row];
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return checkList.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(for: tableView);
        cell.textLabel!.text = "List \(indexPath.row)";
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil);
    }
    
    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell";
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell;
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier);
        }
    };

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
