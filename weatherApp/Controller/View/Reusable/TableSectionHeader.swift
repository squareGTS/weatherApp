//
//  TableSectionHeader.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 18.04.2021.
//

import UIKit

final class TableSectionHeaderView: UITableViewHeaderFooterView {
    private let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor.systemIndigo
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configurateViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var reuseIdentifier: String? {
        "TableSectionHeaderView"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
    
    private func configurateViews() {
        addSubview(myLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = self.bounds
//        NSLayoutConstraint.activate([
//            myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            myLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
//            myLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
//        ])
    }
    
    func configure(with name: String) {
        myLabel.text = name
    }
}
