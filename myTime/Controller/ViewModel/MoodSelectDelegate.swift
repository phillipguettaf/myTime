//
//  MoodSelectDelegate.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

protocol MoodSelectDelegate: UIViewController {
    func selectMood(mood: Float, image: String)
}
