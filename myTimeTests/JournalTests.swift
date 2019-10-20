//
//  JournalTests.swift
//  myTimeTests
//
//  Created by Aaron on 7/10/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest
@testable import myTime

class JournalTests: XCTestCase {
    var journal: JournalEntryView = JournalEntryView();
    var journalTable: TableCell = TableCell();
    var TableView: JournalEntryView = JournalEntryView();
    var moodView: MoodOptionView = MoodOptionView();

    func testMoodValueBeforeClick() {
            
        // Making sure no fixed value was set before selecting mood
        let moodGuess = journal.mood?.advanced(by: 0)
        XCTAssertEqual(moodGuess, nil)
            
        let guess = journal.mood?.binade
        XCTAssertEqual(guess, nil)

    }
    
    // Checking correct Entry
    func testTableCell() {
        let content = journalTable.entry?.content
        
        XCTAssertEqual(content, nil)
    }
    
    func JournalTableView() {
        let entryInput = TableView.journalEntryInput
        
        // Should Be nil since there is no pre loaded input
        XCTAssertEqual(entryInput, nil)
    }
    
    func testSelectMood() {
        let guess = moodView.delegate
        let mood = 0.0
        let image = ""
        
        
        if (guess != nil){
            
            let sadMood = guess!.selectMood(mood: 0.0, image: "Mood1VSad.pdf");
            
            XCTAssertEqual(mood, 0.0)
            XCTAssertEqual(image, "Mood1VSad.pdf")
            XCTAssertNotNil(sadMood, "Sad Selected")
            
        }
        
    }
}
