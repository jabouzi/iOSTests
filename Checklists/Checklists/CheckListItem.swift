//
//  CheckListItem.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-01-30.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

class CheckListItem: NSObject, NSCoding {
    var text = "";
    var checked = false;
    
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String;
        checked = aDecoder.decodeBool(forKey: "Checked");
        super.init();
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text");
        aCoder.encode(checked, forKey: "Checked");
    }
    
    init(text: String, checked: Bool) {
        self.text = text;
        self.checked = checked;
        super.init();
    }
    
    func toggelChecked()
    {
        checked = !checked;
    }
}
