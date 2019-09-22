//
//  ProfileBarChart.swift
//  myTime
//
//  Created by Aaron on 21/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Charts
import UIKit

class ProfileBarChartView: UIViewController {
  
    // Reference to ViewModel
    public var profileViewModel: ProfileViewModel!
    
    // Reference to ViewObject
    @IBOutlet weak var bar: BarChartView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setChart(dataPoints: profileViewModel.months, values: profileViewModel.happinessLevel)
        
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
        
        // Combines the data into a variable chartData to be called inside the viewDidLoad
        let chartData = BarChartData(dataSet: chartDataSet)
        
        // Configure text attributes
        chartDataSet.valueFont = UIFont(name: "Verdana", size: 12.0)!
        
        // Transfer data into ViewObject
        bar.data = chartData
    }
    
}
