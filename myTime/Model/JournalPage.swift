//
//  Journal.swift
//  myTime
//
//  Created by Phillip Guettaf on 3/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

class JournalPage {

    var page:[JournalEntry]
    var averageMood:Float = -1
    let month: Int
    
    init(month: Int) {
        page = []
        averageMood = -1
        self.month = month
        
        self.calculateAverageMood()
    }
    
    func calculateAverageMood() {
        let numberOfEntries = page.count
        if numberOfEntries == 0 {
            averageMood = -1
        } else {
            var totalMood:Float = 0
            for entry in page {
                totalMood += entry.mood
            }
            averageMood = totalMood / Float(numberOfEntries)
        }
        
    }
}
