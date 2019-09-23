////
////  TimerControllerView.swift
////  myTime
////
////  Created by Aaron on 21/9/19.
////  Copyright © 2019 RMIT. All rights reserved.
////

// Animation Circle
import Foundation
import UIKit

class TimerControllerView: UIViewController {
    
    @IBOutlet weak var labol: UILabel!
    
    // Draw a circle
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        
        // attributes of the circle
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        // Elements of the circle
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        // thing we want to animate on the shape layer
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        
        // the speed of the animation till completion. DOES NOT EQUAL SECONDS
//        basicAnimation.duration = 30
        basicAnimation.duration = 38
        
        // Allows the edge the stay when finished
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: " ")
        
        
        var score = 30
        let label = 30
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        {
            // this is the code that the timer runs every second
            (_:Timer)->Void in //  the Timer object is passed in, but we ignore it
            if(score>0)
            {
                score -= 1 ; // increment the score
            }
            self.labol.text = String(score) // set label's text to be the current store
        }

        
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
