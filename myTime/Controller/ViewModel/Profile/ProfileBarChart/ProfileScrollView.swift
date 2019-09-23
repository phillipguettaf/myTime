//
//  ProfileScrollView.swift
//  myTime
//
//  Created by Phillip Guettaf on 22/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ProfileScrollView: UIScrollView {
    
    @IBOutlet weak var frequency: BarChartView!
    @IBOutlet weak var aveMood: LineChartView!
    
        // Create some Data
    let happinessLevel = [2.0, 4.0, 6.0, 3.0, 8.0, 9.0, 2.0, 1.0, 5.0, 6.0, 7.0, 4.0]
    let months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    func refresh() {
        setChart(dataPoints: months, values: happinessLevel)
    }
    
    func setChart(dataPoints: [Int], values: [Double])
    {
        
        // Input data into created array
        var dataEntries: [BarChartDataEntry] = []
        
        // loop for every months value defined above we put values inside a variable named dataEntry
        // and used dataEntry to append into dataEntries which is the created array
        for i in 0..<dataPoints.count
        {
            let dataEntry = BarChartDataEntry(x: Double(dataPoints[i]), y: Double(values[i]) )
            dataEntries.append(dataEntry)
            
            
        }
        
        
        
        // Sets the data inside chart
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Month")
        let moodDataSet = LineChartDataSet(entries: dataEntries, label: "Month")
        
        // delete value display inside chart
        chartDataSet.drawValuesEnabled = false
        moodDataSet.drawValuesEnabled = false

        
        // Combines the data into a variable chartData to be called inside the viewDidLoad
        let chartData = BarChartData(dataSet: chartDataSet)
        let moodData = LineChartData(dataSet: moodDataSet)
        
        
        chartDataSet.valueFont = UIFont(name: "Verdana", size: 12.0)!
        moodDataSet.valueFont = UIFont(name: "Verdana", size: 12.0)!
        
        // Remove Top and Bottom values
        aveMood.rightAxis.drawLabelsEnabled = false
        aveMood.xAxis.drawLabelsEnabled = false
        frequency.rightAxis.drawLabelsEnabled = false
        frequency.xAxis.drawLabelsEnabled = false
        
        aveMood.data = moodData
        frequency.data = chartData
    }
    
}
