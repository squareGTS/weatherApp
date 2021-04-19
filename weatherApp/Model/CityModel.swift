//
//  CityModel.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

struct CityModel: Equatable {
    var cityName: String
    var cityEmblem: UIImage?
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.cityName == rhs.cityName
    }
}
