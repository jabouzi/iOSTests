//
//  WeatherFetcher.swift
//  SwinjectSimpleExample
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WeatherFetcher {
    let networking: Networking
    
    func fetch(response: @escaping ([City]?) -> ()) {
        networking.request { data in
            let cities = data.map { self.decode(data: $0 as NSData) }
            response(cities)
        }
    }
    
    private func decode(data: NSData) -> [City] {
        let json = JSON(data: data as Data)
        var cities = [City]()
        for (_, j) in json["list"] {
            if let id = j["id"].int {
                let city = City(
                    id: id,
                    name: j["name"].string ?? "",
                    weather: j["weather"][0]["main"].string ?? "")
                cities.append(city)
            }
        }
        return cities
    }
} 
