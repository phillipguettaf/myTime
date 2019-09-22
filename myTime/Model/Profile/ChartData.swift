//
//  ChartData.swift
//  myTime
//
//  Created by Aaron on 22/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
import UIKit
import Foundation

struct ChartData {
    let months: [Int]
    let happinessLevel: [Double]
    
    init(months: [Int], happinessLevel: [Double])
    {
        self.months = months
        self.happinessLevel = happinessLevel
    }
}
