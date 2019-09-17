//
//  Journal.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import CoreData

class Journal {
    var entries: [JournalEntry]
    // Pages sorted by [Year: [Month: Page]]
    var pages: [Int: [Int: JournalPage]]
    
    init() {
        let fetchRequest: NSFetchRequest<JournalEntry> = JournalEntry.fetchRequest()
        pages = [:]
        do {
            let entries = try JournalContainer.context.fetch(fetchRequest)
            self.entries = entries
            self.sortEntries()
        } catch {
            entries = [JournalEntry]()
        }
    }
    
    func sortEntries() {
        let calendar = Calendar.current
        for entry in entries {
            
            let entryYear = calendar.component(.year, from: entry.timeStamp! as Date)
            let entryMonth = calendar.component(.month, from: entry.timeStamp! as Date)
            
            if (pages[entryYear] == nil) {
                pages[entryYear] = [:]
            }
            if pages[entryYear]![entryMonth] == nil {
                pages[entryYear]![entryMonth] = JournalPage(month: entryMonth)
            }
            pages[entryYear]![entryMonth]!.page.append(entry)
        }
        for (_, monthPage) in pages {
            for (_, page) in monthPage {
                page.calculateAverageMood()
            }
        }
    }
}

