//
//  CheckListItem.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-01-30.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    var text = "";
    var checked = false;
    
    init(text: String, checked: Bool) {
        self.text = text;
        self.checked = checked;
    }
    
    func toggelChecked()
    {
        checked = !checked;
    }
}
