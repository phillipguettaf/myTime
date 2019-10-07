//
//  ProfileTests.swift
//  myTimeTests
//
//  Created by Aaron on 7/10/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest
@testable import myTime
class ProfileTests: XCTestCase {
    var profile: ProfileScrollView = ProfileScrollView();

    override func setUp() {
        profile = ProfileScrollView();
    }

    override func tearDown() {
    }

    func testProfileScroll() {
        let happiness = profile.happinessLevel
        let months = profile.months
        
        let happinessArray = happiness.capacity
        let monthArray = months.capacity
        
        XCTAssertEqual(happinessArray, 12)
        XCTAssertEqual(monthArray, 12)
        
        //        profile.setChart(dataPoints: months, values: happinessLevel)
        
        XCTAssertEqual(profile.months, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
        XCTAssertEqual(profile.happinessLevel, [2.0, 4.0, 6.0, 3.0, 8.0, 9.0, 2.0, 1.0, 5.0, 6.0, 7.0, 4.0])

        
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
