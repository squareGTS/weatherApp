//
//  CitiesTableViewCellXib.swift
//  WetherGB
//
//  Created by Станислав Белых on 07.05.2021.
//

import UIKit

class CitiesTableViewCellXib: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var shadowView: UIView!
    @IBOutlet private var cityImageView: UIImageView!
    
    static let reuseIdentifier = "CitiesTableViewCellXib"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        shadowView.layer.shadowColor = UIColor.cyan.cgColor
        shadowView.layer.cornerRadius = 50
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.9
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        cityImageView.layer.cornerRadius = 50
        cityImageView.layer.masksToBounds = true
        cityImageView.layer.borderWidth = 2
        cityImageView.layer.borderColor = UIColor.systemGray3.cgColor
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        cityImageView.image = UIImage(named: "PlaceholderImage")
    }
    
    func configure(_ city: City) {
        titleLabel.text = city.name
        
        if let image = city.image {
            cityImageView.image = image
        } else {
            cityImageView.image = UIImage(named: "PlaceholderImage")
        }
        
    }
}
