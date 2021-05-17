//
//  City.swift
//  WetherGB
//
//  Created by Станислав Белых on 07.05.2021.
//

import UIKit

struct City {
    
    let name: String
    let image: UIImage?
    
    static let cities: [City] = [
        City(name: "Воркута", image: UIImage(named: "vorcuta")),
        City(name: "Новосибирск", image: UIImage(named: "novosibirsk")),
        City(name: "Магадан", image: UIImage(named: "magadan")),
        City(name: "Оренбург", image: UIImage(named: "orenburg")),
        City(name: "Уфа", image: UIImage(named: "ufa")),
        City(name: "Краснодар", image: UIImage(named: "krasnodar")),
        City(name: "Орск", image: UIImage(named: "orsk")),
        City(name: "Простоквашино", image: UIImage(named: "prostokvasheno")),
        City(name: "Барнаул", image: UIImage(named: "barnaul")),
        City(name: "Сочи", image: UIImage(named: "sochi")),
        City(name: "Москва", image: UIImage(named: "Moscow"))
    ]
}
