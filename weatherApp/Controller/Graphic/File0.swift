//
//  File0.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 12.04.2021.
//

import UIKit

class TestViewController: UIViewController {
    let testView = TestView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)
        testView.backgroundColor = .red
    }
}

class TestView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.fill(CGRect(x: 0.0, y: 0.0, width: 70.0, height: 70.0))
    }
}
