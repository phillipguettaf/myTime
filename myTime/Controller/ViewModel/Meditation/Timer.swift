//
//  Timer.swift
//  myTime
//
//  Created by Aaron on 21/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Charts
import UIKit

class Timer: UIViewController{
    
    @IBOutlet weak var lbl: UILabel!
    
    var time = 0
    
    //timer
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
