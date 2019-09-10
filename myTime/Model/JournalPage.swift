//
//  Journal.swift
//  myTime
//
//  Created by Phillip Guettaf on 3/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

class JournalPage {

    private var page:[JournalEntry]
    private var averageMood:Float
    
    init() {
        page = []
        averageMood = -1
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
