//
//  MonthButton.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class MonthButton: UIView {

    var button: UIButton
    var tableDelegate: TableViewDelegate?
    
    var monthPage: JournalPage?  {
        didSet {
            guard let month = monthPage else {return}
            var monthTitle: String
            switch month.month {
                case 1:
                    monthTitle = "Jan"
                case 2:
                    monthTitle = "Feb"
                case 3:
                    monthTitle = "Mar"
                case 4:
                    monthTitle = "Apr"
                case 5:
                    monthTitle = "May"
                case 6:
                    monthTitle = "Jun"
                case 7:
                    monthTitle = "Jul"
                case 8:
                    monthTitle = "Aug"
                case 9:
                    monthTitle = "Sep"
                case 10:
                    monthTitle = "Oct"
                case 11:
                    monthTitle = "Nov"
                case 12:
                    monthTitle = "Dec"
                default:
                    monthTitle = "NA"
            }
            button.setTitle(monthTitle, for: .normal)
            self.calculateBackgroundColour()
        }
    }

    override init(frame: CGRect) {
        button = UIButton()
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        super.init(frame: rect)
        
        self.addSubview(button)
        
       button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.layer.cornerRadius = 12
        
        self.calculateBackgroundColour()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        tableDelegate!.segue(month: monthPage!)
    }
    
    func calculateBackgroundColour() {
        
        var red: CGFloat
        var green: CGFloat
        let blue: CGFloat = 0
        let transparency: CGFloat = 1
        
        if let month = monthPage{
            month.calculateAverageMood()
            let aveMood = month.averageMood + 1
            switch aveMood {
                case 1.0:
                    red = 1.0
                    green = 0
                case 1.0...2.0:
                    red = 1.0
                    green = CGFloat((aveMood - 1)/2)
                case 2.0:
                    red = 1.0
                    green = 0.5
                case 2.0...3.0:
                    red = 1.0
                    green = CGFloat((aveMood-2)/2 + 0.5)
                case 3.0:
                    red = 1.0
                    green = 1.0
                case 3.0...4.0:
                    red = CGFloat((4-aveMood/2) + 0.5)
                    green = 1.0
                case 4.0:
                    red = 0.5
                    green = 1.0
                case 4.0...5.0:
                    red = CGFloat((5-aveMood)/2)
                    green = 1.0
                case 5.0:
                    red = 0
                    green = 1.0
                default:
                    red = 0
                    green = 0
                }
            } else {
                red = 0
                green = 0
            }
            let bgColor = UIColor(red: red, green: green, blue: blue, alpha: transparency)
            if isBackgroundBright(r: red, g: green, b: blue) {
                button.setTitleColor(.black, for: .normal)
            } else {
                button.setTitleColor(.white, for: .normal)
            }
            self.backgroundColor = bgColor
        }
    
    
    // Formula for determining perceived brightness taken from W3 Consortium
    // "Techniques for Accessibility Evaluation and Repair Tools" 26/April/2000
    // (https://www.w3.org/TR/AERT/#color-contrast)
    func isBackgroundBright(r: CGFloat, g: CGFloat, b: CGFloat) -> Bool {
        let red = r * 255
        let blue = b * 255
        let green = g * 255
        let brightnessValue = ((red * 299) + (green * 587) + (blue * 114))/1000
        if brightnessValue > 125 {
            return true
        } else {
            return false
        }
    }
}
