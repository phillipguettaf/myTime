//
//  GradientView.swift
//  myTime
//
//  Created by Phillip Guettaf on 23/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {

    private var gradient: CAGradientLayer?
    @IBInspectable var startColor: UIColor?
    @IBInspectable var endColor: UIColor?
    @IBInspectable var angle: CGFloat = 270
    
    
    override var frame: CGRect {
        didSet {
            updateGradient()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        installGradient()
        updateGradient()
    }
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    private func installGradient() {
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.insertSublayer(gradient, at: 0)
        self.gradient = gradient
    }
    
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            let (start, end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.endPoint = end
            gradient.frame = self.bounds
        }
    }
    
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        let end = pointForAngle(angle)
        let start = oppositePoint(end)
        
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        return (p0, p1)
    }
    
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        
        if (fabs(x) > fabs(y)) {
            x = x > 0 ? 1: -1
            y = x * tan(radians)
        } else {
            y = y > 0 ? 1: -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }
    
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
    
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }
}
