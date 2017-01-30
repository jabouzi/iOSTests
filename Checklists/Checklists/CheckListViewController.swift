//
//  ViewController.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-01-29.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath);
//        cell.contentView = cell.hashValue;
        
        let label = cell.viewWithTag(1000) as! UILabel;
        label.text = "\(indexPath.row)";
        
        return cell;
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

