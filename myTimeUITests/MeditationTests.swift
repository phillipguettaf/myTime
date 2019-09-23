//
//  MeditationTests.swift
//  myTimeUITests
//
//  Created by Aaron on 23/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

import XCTest

class MeditationTests: XCTestCase {
    
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
        XCTAssertEqual(app.tabBars.buttons["Relax"].label, "Relax")
        
        
        XCTAssertEqual(app.buttons["START"].label, "START")
        
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        XCTAssertEqual(app.navigationBars.buttons["Back"].label, "Back")
        
        let datePickersQuery = app.datePickers
        datePickersQuery.pickerWheels["22 hours"]/*@START_MENU_TOKEN@*/.press(forDuration: 1.5);/*[[".tap()",".press(forDuration: 1.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        datePickersQuery.pickerWheels["23 min"]/*@START_MENU_TOKEN@*/.press(forDuration: 1.4);/*[[".tap()",".press(forDuration: 1.4);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        

}

}
