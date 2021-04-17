//
//  CustomControl.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 17.04.2021.
//

import UIKit

enum Day: String, CaseIterable {
    case monday, tuesday, wednesday, thusday, friday, saturday, sunday
    // all cases that can exist
    //static var allCases: [Day]
}

final class MyControl: UIControl {
    var selectedDay: Day? = nil {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    var likeCounter: Int = 0
    var isLiked: Bool = false
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView?
    
    init(likes: Int, isLiked: Bool, frame: CGRect) {
        super.init(frame: frame)
        
        likeCounter = likes
        self.isLiked = isLiked
        configurate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configurate()
    }
    
    private func configurate() {
        Day.allCases.forEach { (day) in
            let button = UIButton(type: .system)
            button.setTitle(day.rawValue, for: [])
            button.setTitleColor(.red, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        stackView?.axis = .horizontal
        stackView?.alignment = .center
        stackView?.distribution = .fillEqually
        stackView?.spacing = 4.0
        
        addSubview(stackView!)
    }
    
    private func updateSelectedDay() {
        buttons.forEach { (button) in
            button.isSelected = button.title(for: []) == selectedDay?.rawValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView?.frame = bounds
        
    }
    
   
    
    @objc private func selectDay(_ sender: UIButton) {
        guard let day = Day(rawValue: sender.title(for: [])!) else { return }
        self.selectedDay = day
        
    }
}
