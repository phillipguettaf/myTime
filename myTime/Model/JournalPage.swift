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
        let numberOfEntries = page.count == 0 ? -1:page.count
        var totalMood:Int = 0
        if numberOfEntries == 0 {
            averageMood = -1
        } else {
            for entry in page {
            // (to be implemented with getMood)    totalMood += entry.mood
            }
            averageMood = (Float) (totalMood/numberOfEntries)
        }
        
    }
}
