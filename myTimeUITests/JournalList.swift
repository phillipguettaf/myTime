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
        app.tabBars.buttons["Journal"].tap()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Sep"]/*[[".cells.buttons[\"Sep\"]",".buttons[\"Sep\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let staticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["22/9/19"]/*[[".cells.staticTexts[\"22\/9\/19\"]",".staticTexts[\"22\/9\/19\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        staticText.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["2019"]/*[[".pickers.pickerWheels[\"2019\"]",".pickerWheels[\"2019\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars.buttons["Compose"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
           
        
        
     
        
        
        
    }
    
}
