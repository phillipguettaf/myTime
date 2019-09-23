//
//  JournalEntryTest.swift
//  myTimeUITests
//
//  Created by Phillip Guettaf on 23/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest

class JournalEntryTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        
        app.buttons["Compose"].tap()
        
        let isEntryViewPresent = app.otherElements["JournalEntryView"].exists
        
        XCTAssertTrue(isEntryViewPresent)
        XCTAssertTrue(app.buttons["Mood Select"].exists)
        XCTAssertTrue(app.buttons["Save"].exists)
        XCTAssertTrue(app.buttons["Back"].exists)
        
        app.buttons["Mood Select"].tap()
        XCTAssertTrue(app.otherElements["MoodOptionView"].exists)
        
        app.buttons["Mood1VSad"].tap()
        app.textFields["entryField"].typeText("Dear Diary")
        
        app.buttons["Save"].tap()
        
        app.terminate()
    }

}
