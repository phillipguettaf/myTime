//
//  MoodTests.swift
//  myTimeTests
//
//  Created by Aaron on 7/10/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest
@testable import myTime
class MonthPage: XCTestCase {

    var MC: MonthCell = MonthCell();
    
    // Check For Already Existing Month page
    func testPreMonthPage() {
        let startUpPage = MC.monthPage
        
        // Check if There is initial month Page (Should be nil)
        XCTAssertNil(startUpPage)
        
    }
        
}




// make at least four separate unit tests
// containing pre-conditions, actions, post-conditions and Assertions
//
//}

//func testScoreIsComputed() {
//    // 1. given
//    let guess = sut.targetValue + 5
//
//    // 2. when
//    sut.check(guess: guess)
//
//    // 3. then
//    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
//}

