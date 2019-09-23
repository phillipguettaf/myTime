
//let app = XCUIApplication()
//app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element(boundBy: 1).tap()
//
//let tabBarsQuery = app.tabBars
//tabBarsQuery.buttons["Relax"].tap()
//tabBarsQuery.buttons["Profile"].tap()
//app.otherElements[" 4: 3.00"].tap()
//app.otherElements[" 5: 8.00"].tap()
//app.otherElements[" 6: 9.00"].tap()
//
//  myTimeUITests.swift
//  myTimeUITests
//
//  Created by Phillip Guettaf on 3/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest

class myTimeUITests: XCTestCase {

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
        
        
    }

}
