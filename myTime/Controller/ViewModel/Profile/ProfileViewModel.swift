//
//  ProfileViewModel.swift
//  myTime
//
//  Created by Aaron on 22/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Charts

public final class ProfileViewModel {
    
    // Instance properties
    let chartData: ChartData
    var happinessLevel = [2.0, 4.0, 6.0, 3.0, 8.0, 9.0, 2.0, 1.0, 5.0, 6.0, 7.0, 4.0]
    var months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    // Initalise
    private init(chartData: ChartData) {
        
    self.chartData = chartData
    months = chartData.months
    happinessLevel = chartData.happinessLevel
        
    }
 
}
