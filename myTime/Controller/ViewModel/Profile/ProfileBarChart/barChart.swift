//
//  barChart.swift
//  myTime
//
//  Created by Aaron on 21/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Charts
import UIKit
class barChart: UIViewController{
    

 @IBOutlet weak var barChart1: BarChartView!

func setChart()
{
    let happinessLevel = [2.0, 4.0, 6.0, 3.0, 8.0, 9.0, 2.0, 1.0, 5.0, 6.0, 5.0, 4.0]
    
    let months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0..<months.count
    {
        let dataEntry = BarChartDataEntry(x: Double(months[i]), y: Double(happinessLevel[i]))
        
        dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Months")
    let chartData = BarChartData(dataSet: chartDataSet)
    
    barChart1.data = chartData
}

}
