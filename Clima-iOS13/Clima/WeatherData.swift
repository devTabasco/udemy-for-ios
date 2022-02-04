//
//  WeatherData.swift
//  Clima
//
//  Created by 임창용 on 2022/01/28.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{  //encodable + decodable => codable
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable{
    let temp: Double
}

struct Weather: Codable{
    let id: Int
    let description: String
}
