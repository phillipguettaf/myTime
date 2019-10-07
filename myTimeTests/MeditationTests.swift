//
//  MeditationTests.swift
//  myTimeTests
//
//  Created by Aaron on 7/10/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import XCTest
@testable import myTime

class MeditationTests: XCTestCase {

    var meditation: TimerControllerView = TimerControllerView();

    
    override func setUp() {
        meditation = TimerControllerView();
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBreathingShape() {
        //    let guess = timerController.circleLayer.opacity + 5
        
        let ifTapped = meditation.tapped
        
        if (ifTapped)
        {
            XCTAssertFalse(meditation.navbar.isHidden)
            XCTAssertEqual(meditation.countdownLayer.opacity, 1)
            XCTAssertEqual(meditation.countdownTrackLayer.opacity, 1)
        }
        
        XCTAssertEqual(meditation.darkColor, UIColor(red: 33/255, green: 79/255, blue: 81/255, alpha: 1.0).cgColor)
    
        
        
    }
    
    func testTimeInterval() {
        
        
        let guess = meditation.duration + 20
        XCTAssertEqual(guess, 30)
        
        let initial = meditation.duration
        XCTAssertEqual(initial, 10)
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
