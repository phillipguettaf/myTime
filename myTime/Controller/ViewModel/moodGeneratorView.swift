//
//  moodGeneratorView.swift
//  myTime
//
//  Created by Aaron on 21/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Macaw


struct Sale {
    var month: String
    var value: Double
}

class moodGeneratorView: MacawView {
    
    static let lastFiveShows = dummyData()
    static let maxValue = 6000
    static let maxvalueLineHeight = 180
    static let lineWidth: Double = 275
    
    
    
    private static func dummyData() -> [swiftMood]
    {
        let one = swiftMood(showNumber: "55", viewCount: 3456)
        let two = swiftMood(showNumber: "56", viewCount: 3141)
        let three = swiftMood(showNumber: "57", viewCount: 5324)
        let four = swiftMood(showNumber: "58", viewCount: 6543)
        
        return [one, two, three, four]
    }
    
    static var randomizedSale: Double {
        return Double(arc4random_uniform(10000) + 1) / 10
    }
    
    static func data() -> [Sale] {
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        var sales = [Sale]()
        
        for month in months {
            let sale = Sale(month: month, value: randomizedSale)
            sales.append(sale)
        }
        
        return sales
    }
}
