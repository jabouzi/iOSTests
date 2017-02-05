//
//  CheckList.swift
//  Checklists
//
//  Created by Skander Jabouzi on 2017-02-05.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

class CheckList: NSObject, NSCoding {
    var text = "";
    
    init(text: String) {
        self.text = text;
        super.init();
    }
    
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String;
        super.init();
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text");
    }
}

