////
////  TimerControllerView.swift
////  myTime
////
////  Created by Aaron on 21/9/19.
////  Copyright © 2019 RMIT. All rights reserved.
////

// Animation Circle

import UIKit

class TimerControllerView: UIViewController {
    
    // Draw a circle
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        // attributes of the circle
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        // Elements of the circle
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        // calling to enable tapping
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    // does something when clicking
    @objc private func handleTap() {
        
        // thing we want to animate on the shape layer
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        // the speed of the animation till completion
        basicAnimation.duration = 30
        
        // Allows the edge the stay when finished
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: " ")
    }
}


















// Counting Down

//import Foundation
//import Charts
//import UIKit
//
//class TimerControllerView: UIViewController {
//
//    @IBOutlet weak var pickerView: UIDatePicker!
//    @IBOutlet weak var lbl: UILabel!
//    @IBOutlet weak var start: UIButton!
//
//    var time = 50
//
//    //timer
//    var timer = Timer()
//
//     var pickerData: [String] = [String]()
//
//
//    @IBAction func start(_ sender: UIButton)
//    {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerControllerView.action), userInfo: nil, repeats: true)
//    }
//
//    @objc func action()
//    {
//        time -= 1
//        lbl.text = String(time)
//    }
