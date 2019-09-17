//
//  MoodOptionView.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class MoodOptionView: UIViewController {
    
    weak var delegate:MoodSelectDelegate?
    
    @IBAction func onVSadTapped(_ sender: Any) {
        delegate?.selectMood(mood: 1.0, image: "Mood1VSad.pdf")
    }
    
    @IBAction func onSadTapped(_ sender: Any) {
        delegate?.selectMood(mood: 2.0, image: "Mood2Sad.pdf")
    }
    
    @IBAction func onMediumTapped(_ sender: Any) {
        delegate?.selectMood(mood: 3.0, image: "Mood3Medium.pdf")
    }
    
    @IBAction func onHappyTapped(_ sender: Any) {
        delegate?.selectMood(mood: 4.0, image: "Mood4Happy.pdf")
    }
    
    @IBAction func onVHappyTapped(_ sender: Any) {
        delegate?.selectMood(mood: 5.0, image: "Mood5VHappy.pdf")
    }
}
