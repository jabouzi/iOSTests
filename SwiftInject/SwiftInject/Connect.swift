//
//  Connect.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

protocol pConnect {
    var url: String? { get }
    var port: String? { get }
    var nameSpace: String? { get }
    
    func connect(url: String, port: String, nameSpace: String)
}

class Connect: pConnect {
    var url: String?
    var port: String?
    var nameSpace: String?
    
    func connect(url: String, port: String, nameSpace: String) {
        self.url = url
        self.port = port
        self.nameSpace = nameSpace
        
        print("Connecting ot \(self.url):\(self.port)/\(self.nameSpace)");
    }
}
