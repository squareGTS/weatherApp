//
//  WeatherCollectionCell.swift
//  WetherGB
//
//  Created by Станислав Белых on 30.04.2021.
//

import UIKit

class WeatherCollectionCell: UICollectionViewCell {
    static let reuseID =  "WeatherCollectionCell"
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .cyan
    }
}
