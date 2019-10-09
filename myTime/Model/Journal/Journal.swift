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

    private init() {}
    
    static var journal = Journal()
    var entries: [JournalEntry] = []
    // Pages sorted by [Year: [Month: Page]]
    var pages: [Int: [Int: JournalPage]] = [:]
    var loadedFromCloud = false
    weak var updateDelegate: JournalUpdateDelegate?
    
    func load() {
        // Create fetch request (to get data from the container)
        let fetchRequest: NSFetchRequest<JournalEntry> = JournalEntry.fetchRequest()
        pages = [:]
        do {
            
            if !loadedFromCloud {
                CloudStorage.shared.readOnLoad()
            }
            
            if self.entries == [] {
                self.entries = try JournalContainer.context.fetch(fetchRequest)
                if self.entries.count > 0 {CloudStorage.shared.create(journalToSave: entries)}
            }
            
            if entries.count == 0 {
                let calendar = Calendar.current
                let today = Date()
                let year = calendar.component(.year, from: today)
                let month = calendar.component(.month, from: today)
                pages[year] = [month: JournalPage(month: month)]
            } else {
                // Sort entries
                self.sortEntries()
            }
        } catch {
            entries = [JournalEntry]()
        }
    }
    
    func sortEntries() {
        let calendar = Calendar.current
        for entry in entries {
            // Parse the entry to get the year and month from the timeStamp
            let entryYear = calendar.component(.year, from: entry.timeStamp! as Date)
            let entryMonth = calendar.component(.month, from: entry.timeStamp! as Date)
            
            // If the year is not in the pages dictionary: initialise the page
            if (pages[entryYear] == nil) {
                pages[entryYear] = [entryMonth: JournalPage(month: entryMonth)]
            }
            // If the month is not in the pages[year] dictionary, initialise the page
            if pages[entryYear]![entryMonth] == nil {
                pages[entryYear]![entryMonth] = JournalPage(month: entryMonth)
            }
            // Add the entry to the year, month
            pages[entryYear]![entryMonth]!.page.append(entry)
        }
        
        // Iterate over the dictionary and update the average mood
        for (_, monthPage) in pages {
            for (_, page) in monthPage {
                page.calculateAverageMood()
            }
        }
    }
    
    func updateJournal(_ journalEntries: [JournalEntry]) {
        print("Journal update: ")
        Journal.journal.loadedFromCloud = true
        Journal.journal.entries = journalEntries
        Journal.journal.load()
        updateDelegate?.updateJournal()
    }
}

