//
//  Socket.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

protocol pSocket {
    var connect: Connect { get }
    var url: String { get }
    var port: String { get }
    var nameSpace: String { get }
    
    func _connect()
}

class Socket: pSocket {
    var connect: Connect
    var url: String
    var port: String
    var nameSpace: String
    
    init(connect: Connect, url: String, port: String, nameSpace: String) {
        self.connect = connect
        self.url = url
        self.port = port
        self.nameSpace = nameSpace
    }
    
    func _connect() {
        self.connect.connect(url: self.url, port: self.port, nameSpace: self.nameSpace);
    }
}
