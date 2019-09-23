//
//  profileUITests.swift
//  myTimeUITests
//
//  Created by Aaron on 22/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest

class profileUITests: XCTestCase {
    
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
        
        let app = XCUIApplication()
        app.tabBars.buttons["Profile"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.staticTexts["John Smith"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Journal Frequency"]/*[[".scrollViews.staticTexts[\"Journal Frequency\"]",".staticTexts[\"Journal Frequency\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
      
        app.tabBars.buttons["Profile"].tap()
        
        let element = app.scrollViews.children(matching: .other).element(boundBy: 0)
        element.otherElements[" 1: 2.00"].tap()
        element.otherElements[" 2: 4.00"].tap()
        element.otherElements[" 3: 6.00"].tap()
        element.otherElements[" 4: 3.00"].tap()
        element.otherElements[" 5: 8.00"].tap()
        element.otherElements[" 6: 9.00"].tap()
        element.otherElements[" 7: 2.00"].tap()
        element.otherElements[" 8: 1.00"].tap()
  
        

        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }
    
}
