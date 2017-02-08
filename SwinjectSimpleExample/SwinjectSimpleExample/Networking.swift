//
//  Networking.swift
//  SwinjectSimpleExample
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

protocol Networking {
    func request(_ response: @escaping (Data?) -> ())
}
