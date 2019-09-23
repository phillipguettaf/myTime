//
//  FirstControlla.swift
//  myTimePeter
//
//  Created by Peter Margaritis on 22/9/19.
//  Copyright © 2019 Peter Margaritis. All rights reserved.
//

import Foundation
import UIKit

class FirstControlla: UIViewController {
    
    @IBOutlet weak var start: UIButton!
    
    var time = 50 
    
    //timer
    var timer = Timer()
    
    var pickerData: [String] = [String]()
    
    
    @IBAction func start(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FirstControlla.action), userInfo: nil, repeats: true)
    }
    
    @objc func action()
    {
        time -= 1
        lbl.text = String(time)
    }
    @IBAction func timeChange(_ sender: Any)
    {
        var dadada = pickerView.countDownDuration
    }
}
