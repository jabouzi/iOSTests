//
//  SwinjectStoryboard+Setup.swift
//  SwinjectSimpleExample
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(WeatherTableViewController.self) { r, c in
            c.weatherFetcher = r.resolve(WeatherFetcher.self)
        }
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
    }
}
