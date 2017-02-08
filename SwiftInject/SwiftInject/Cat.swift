//
//  Cat.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

protocol Animal {
    var name: String? { get }
}

class Cat: Animal {
    let name: String?;
    
    init(name: String?) {
        self.name = name;
    }
}
