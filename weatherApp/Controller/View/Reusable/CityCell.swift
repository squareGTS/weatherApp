//
//  CityCellTableViewCell.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 18.04.2021.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityEmblemImageView: AvatarImage!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    func configure(name: String, image: UIImage?) {
        cityNameLabel.text = name
        cityEmblemImageView.image = image
    }
}
