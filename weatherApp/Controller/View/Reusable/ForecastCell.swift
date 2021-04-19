//
//  ForecastCell.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 18.04.2021.
//

import UIKit

class ForecastCell: UICollectionViewCell {

    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    
//    override var reuseIdentifier: String? {
//        "ForecastCell"
//    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        backgroundCellView.layer.cornerRadius = (backgroundCellView.bounds.height / 2) - 30
        backgroundCellView.layer.masksToBounds = true
        backgroundCellView.clipsToBounds = false
    }
    
    func configure(temperature: String, tempIcon: UIImage?, date: String) {
        forecastImageView.image = tempIcon
        temperatureLabel.text = temperature
        dateLabel.text = date
    }
}
