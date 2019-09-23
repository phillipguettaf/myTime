

//
//  profileUITests.swift
//  myTimeUITests
//
//  Created by Aaron on 22/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest

class ProfileTests: XCTestCase {
    
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
        
        let app = XCUIApplication()
        app.tabBars.buttons["Profile"].tap()
        
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
        // Label Checking for the correct Strings
        XCTAssertEqual(app.staticTexts["John Smith"].label, "John Smith")
        XCTAssertEqual(app.staticTexts["Journal Frequency"].label, "Journal Frequency")
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["Average Mood"]/*[[".scrollViews.staticTexts[\"Average Mood\"]",".staticTexts[\"Average Mood\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Average Mood")
        
        // Bar and Line Graph both charts have same elements
        // Checks for the correct Line Graph Data
        let lineGraph = app.scrollViews.children(matching: .other).element(boundBy: 1)
        
        XCTAssertEqual(lineGraph.otherElements[" 1: 2.00"].label, " 1: 2.00")
        XCTAssertEqual(lineGraph.otherElements[" 2: 4.00"].label, " 2: 4.00")
        XCTAssertEqual(lineGraph.otherElements[" 3: 6.00"].label, " 3: 6.00")
        XCTAssertEqual(lineGraph.otherElements[" 4: 3.00"].label, " 4: 3.00")
        XCTAssertEqual(lineGraph.otherElements[" 5: 8.00"].label, " 5: 8.00")
        XCTAssertEqual(lineGraph.otherElements[" 6: 9.00"].label, " 6: 9.00")
        XCTAssertEqual(lineGraph.otherElements[" 7: 2.00"].label, " 7: 2.00")
        XCTAssertEqual(lineGraph.otherElements[" 8: 1.00"].label, " 8: 1.00")
        XCTAssertEqual(lineGraph.otherElements[" 9: 5.00"].label, " 9: 5.00")
        XCTAssertEqual(lineGraph.otherElements[" 10: 6.00"].label, " 10: 6.00")
        XCTAssertEqual(lineGraph.otherElements[" 11: 7.00"].label, " 11: 7.00")
        XCTAssertEqual(lineGraph.otherElements[" 12: 4.00"].label, " 12: 4.00")
        
        // Checks for the correct Bar Graph Data
        let barGraph = app.scrollViews.children(matching: .other).element(boundBy: 1)
        
        XCTAssertEqual(barGraph.otherElements[" 1: 2.00"].label, " 1: 2.00")
        XCTAssertEqual(barGraph.otherElements[" 2: 4.00"].label, " 2: 4.00")
        XCTAssertEqual(barGraph.otherElements[" 3: 6.00"].label, " 3: 6.00")
        XCTAssertEqual(barGraph.otherElements[" 4: 3.00"].label, " 4: 3.00")
        XCTAssertEqual(barGraph.otherElements[" 5: 8.00"].label, " 5: 8.00")
        XCTAssertEqual(barGraph.otherElements[" 6: 9.00"].label, " 6: 9.00")
        XCTAssertEqual(barGraph.otherElements[" 7: 2.00"].label, " 7: 2.00")
        XCTAssertEqual(barGraph.otherElements[" 8: 1.00"].label, " 8: 1.00")
        XCTAssertEqual(barGraph.otherElements[" 9: 5.00"].label, " 9: 5.00")
        XCTAssertEqual(barGraph.otherElements[" 10: 6.00"].label, " 10: 6.00")
        XCTAssertEqual(barGraph.otherElements[" 11: 7.00"].label, " 11: 7.00")
        XCTAssertEqual(barGraph.otherElements[" 12: 4.00"].label, " 12: 4.00")
        
        
    }
    
}
