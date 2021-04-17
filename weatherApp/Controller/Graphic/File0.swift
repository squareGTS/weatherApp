//
//  File0.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 12.04.2021.
//

import UIKit

class TestViewController: UIViewController {
    let testView = TestView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
    // while we not call myControl lazy will not allow to triger
    private lazy var myControl = MyControl(likes: 1, isLiked: false, frame: CGRect(x: 4, y: 4, width: view.bounds.width, height: 100))
    
    
    
    @IBInspectable var borderWidth: CGFloat = 10
    @IBAction func buttonPressed(_ sender: Any) {
        
        //transformation()
        transformation3D()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testView)        //testView.backgroundColor = .red
        view.addSubview(myControl)
        myControl.addTarget(self, action: #selector(someFunc0), for: .valueChanged)
        //myControl.addAction(@Ibaction someAction(), for: .valueChanged)
        
        let grTap = UITapGestureRecognizer(target: self, action: #selector(someFunc))
        let grLP = UILongPressGestureRecognizer(target: self, action: #selector(someFunc))
        //Drag
        let grPan = UIPanGestureRecognizer(target: self, action: #selector(someFunc))
        let grSwipe = UISwipeGestureRecognizer(target: self, action: #selector(someFunc))
        grSwipe.direction = .right
        let grRotation = UIRotationGestureRecognizer(target: self, action: #selector(someFunc))
        //two fingers zom
        let grPinch = UIPinchGestureRecognizer(target: self, action: #selector(someFunc))
        let grScreenEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(someFunc(_ :)))
        grScreenEdge.edges = [.right, .left]
        
        view.addGestureRecognizer(grScreenEdge)
        
        testView.addGestureRecognizer(grPan)
        
        
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
        
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func someFunc(_ recognizer: UIGestureRecognizer) {
        guard let recognizer = recognizer as? UIPanGestureRecognizer else { return }
        print(recognizer.translation(in: view))
        print("I'm gesture recognizer")
    }
    
    @objc private func someFunc0() {
        // myControl.selectedDay
        print("Hello from Control")
    }
    
    @IBAction private func someAction() {
        
    }
    
    
    func transformation() {
        let transform0 = CGAffineTransform(rotationAngle: .pi / 4)
        let transform1 = CGAffineTransform(scaleX: 1.5, y: 0.5)
        let transform2 = CGAffineTransform(translationX: 50, y: 50)
        testView.transform = transform2
        // return previous value
        testView.transform = .identity
        // connect transformation
        testView.transform = transform0.concatenating(transform1).concatenating(transform2)
        
    }
    
    func transformation3D() {
        let transform0 = CATransform3DMakeScale(0.8, 0.8, -1.5)
        let transform1 = CATransform3DMakeRotation(.pi / 4, 1.2, 1.2, 1.2)
        let transform2 = CATransform3DMakeTranslation(4.0, 4.0, -4.0)
           
        testView.layer.transform = transform0
        
        // return previous value
        testView.transform = .identity
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        print(touch?.location(in: view))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
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
