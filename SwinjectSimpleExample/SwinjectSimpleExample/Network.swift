//
//  Network.swift
//  SwinjectSimpleExample
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(_ networkResponse: @escaping (Data?) -> ()) {
        Alamofire.request(OpenWeatherMap.url, parameters: OpenWeatherMap.parameters).responseData { (dataResponse) in
            networkResponse(dataResponse.data)
        }
    }
}
