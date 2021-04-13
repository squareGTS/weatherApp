//
//  File0.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 12.04.2021.
//

import UIKit

class TestViewController: UIViewController {
    let testView = TestView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    @IBInspectable var borderWidth: CGFloat = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)
        //testView.backgroundColor = .red
        
        
        //testView.setNeedsDisplay()
        
        
        testView.layer.borderWidth = borderWidth
        testView.layer.borderColor = UIColor.white.cgColor
        //testView.layer.maskedCorners = CACornerMask(rawValue: 10)
        testView.layer.cornerRadius = 20
        //testView.layer.masksToBounds = true
        
        
        
        testView.layer.shadowColor = UIColor.gray.cgColor
        testView.layer.shadowOpacity = 1.0
        testView.layer.shadowRadius = 10
        testView.layer.shadowOffset = CGSize.zero
        
//        testView.layer.backgroundColor
//        testView.addSubview(<#T##view: UIView##UIView#>)
//        testView.layer.insertSublayer(<#T##layer: CALayer##CALayer#>, below: <#T##CALayer?#>)
        
        
        
        
    }
    
    let button = UIButton()
    
    @IBAction func setState() {
        button.isSelected = true
    }
}

@IBDesignable
class TestView: UIView {
    
    @IBInspectable var radius: CGFloat = 10
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //context.setStrokeColor(UIColor.systemOrange.cgColor)
        //context.fill(CGRect(x: 0.0, y: 0.0, width: 70.0, height: 70.0))
        
        context.setFillColor(UIColor.gray.cgColor)
        context.fillEllipse(in: CGRect(x: rect.midX,
                                       y: rect.midY,
                                       width: radius,
                                       height: radius))
        
        
        context.setStrokeColor(UIColor.red.cgColor)
//        context.move(to: CGPoint(x: 40, y: 40))
//        context.addLine(to: CGPoint(x: 45, y: 40))
//        context.addLine(to: CGPoint(x: 65, y: 40))
//        context.addLine(to: CGPoint(x: 50, y: 50))
//        context.addLine(to: CGPoint(x: 60, y: 70))
//        context.addLine(to: CGPoint(x: 40, y: 55))
//        context.addLine(to: CGPoint(x: 20, y: 70))
//        context.addLine(to: CGPoint(x: 30, y: 50))
//        context.addLine(to: CGPoint(x: 15, y: 40))
//        context.addLine(to: CGPoint(x: 35, y: 40))
//        context.closePath()
        
        returnBezierPath().stroke()
        context.strokePath()
    }
    
    
    
    
    
     func returnBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 40))
        path.addLine(to: CGPoint(x: 45, y: 40))
        path.addLine(to: CGPoint(x: 65, y: 40))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 70))
        path.addLine(to: CGPoint(x: 40, y: 55))
        path.addLine(to: CGPoint(x: 20, y: 70))
        path.addLine(to: CGPoint(x: 30, y: 50))
        path.addLine(to: CGPoint(x: 15, y: 40))
        path.addLine(to: CGPoint(x: 35, y: 40))
        path.close()
        return path
    }
}
