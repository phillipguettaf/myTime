//
//  MeditationTests.swift
//  myTimeUITests
//
//  Created by Aaron on 23/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

import XCTest

class JournalList: XCTestCase {
    
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
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Oct"]/*[[".cells.buttons[\"Oct\"]",".buttons[\"Oct\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.children(matching: .cell).element(boundBy: 2).staticTexts["20/10/19"].tap()
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
}
