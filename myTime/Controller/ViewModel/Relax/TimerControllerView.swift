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
    
    var countdownLayer = CAShapeLayer()
    var countdownTrackLayer = CAShapeLayer()
    var circleLayer = CAShapeLayer()
    var duration: TimeInterval = 10
    var timer = Timer()
    var center:CGPoint?
    var tapped = false {
        didSet {
            if tapped {
                navbar.isHidden = false
                countdownLayer.opacity = 1
                countdownTrackLayer.opacity = 1
                
            } else {
                navbar.isHidden = true
                countdownLayer.opacity = 0
                countdownTrackLayer.opacity = 0
            }
        }
    }
    
    let darkColor = UIColor(red: 33/255, green: 79/255, blue: 81/255, alpha: 1.0).cgColor
    
    @IBOutlet weak var navbar: UINavigationBar!
    
    @IBAction func onDoubleTap(_ sender: Any?) {
        tapped.toggle()
        self.view.layoutIfNeeded()
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbar.setBackgroundImage(UIImage(),for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.isHidden = true
        
        drawCircle(shapeLayer: circleLayer, color: self.darkColor)
        animateCircle(shapeLayer: circleLayer)
        
        drawCountdownPaths(color: self.darkColor)
        animateCountdown(shapeLayer: countdownLayer, duration: duration)
        
        countdownTrackLayer.opacity = 0
        countdownLayer.opacity = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            // this is the code that the timer runs every second
            (_:Timer)->Void in //  the Timer object is passed in, but we ignore it
            if(self.duration > 0) {
                self.duration -= 1 ; // decrement the duration
            } else {
                self.timer.invalidate()
            }
            //self.label.text = String(self.duration) // set label's text to be the remaining time
        }
    }
    
    override func viewDidLayoutSubviews() {
        drawCircle(shapeLayer: circleLayer, color: self.darkColor)
        animateCircle(shapeLayer: circleLayer)
        
        navbar.isHidden = false
        drawCountdownPaths(color: self.darkColor)
        animateCountdown(shapeLayer: countdownLayer, duration: duration)
    }
    
    func drawCountdownPaths(color: CGColor) {
        center = view.center
        drawCountdownPath(shapeLayer: countdownTrackLayer, color: color, toBeAnimated: false)
        drawCountdownPath(shapeLayer: countdownLayer, color: UIColor.gray.cgColor, toBeAnimated: true)
    }

    private func drawCountdownPath(shapeLayer: CAShapeLayer, color: CGColor, toBeAnimated: Bool) {
        
        // attributes of the circle
        let circularPath = UIBezierPath(arcCenter: center!, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        // Elements of the circle
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.fillColor = UIColor.clear.cgColor
        if toBeAnimated {
            shapeLayer.strokeEnd = 0
        }
        view.layer.addSublayer(shapeLayer)
    }
    
    private func animateCountdown(shapeLayer: CAShapeLayer, duration: TimeInterval) {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
        basicAnimation.toValue = 1
        basicAnimation.duration = 40
        // Allows the edge the stay when finished
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "countdown")
        
    }
    
    private func drawCircle(shapeLayer: CAShapeLayer, color: CGColor) {
        center = view.center
        let circularPath = UIBezierPath(arcCenter: center!, radius: 25, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        // Elements of the circle
        shapeLayer.frame = view.bounds
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.fillColor = color
       
        view.layer.addSublayer(shapeLayer)
    }
    
    private func animateCircle(shapeLayer: CAShapeLayer) {
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        basicAnimation.toValue = 4
        basicAnimation.duration = 7
        basicAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = Float.infinity
        
        shapeLayer.add(basicAnimation, forKey: "breathe")
        
    }
}
