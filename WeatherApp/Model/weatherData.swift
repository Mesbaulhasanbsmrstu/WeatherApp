//
//  weatherData.swift
//  WeatherApp
//
//  Created by M29 on 17/12/19.
//  Copyright © 2019 M29. All rights reserved.
//

import Foundation
class weatherData: Codable
{
    let name: String
    let main : Main
    let weather : [Weather]
}
class Main:Codable
{
    let temp: Double
}
class Weather :Codable
{
    let description  : String
    let id: Int
}
