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

    // Test Circle Shape
    func testBreathingShape() {
        
        let ifTapped = meditation.tapped
        
        if (ifTapped)
        {
            XCTAssertFalse(meditation.navbar.isHidden)
            XCTAssertEqual(meditation.countdownLayer.opacity, 1)
            XCTAssertEqual(meditation.countdownTrackLayer.opacity, 1)
        }
        
        // Correct properties
        XCTAssertEqual(meditation.darkColor, UIColor(red: 33/255, green: 79/255, blue: 81/255, alpha: 1.0).cgColor)
    }
    
    // Test Timing of Breathing
    func testTimeInterval() {
        
        let duration = meditation.duration + 20
        XCTAssertEqual(duration, 30)
        
        let initialStartDuration = meditation.duration
        XCTAssertEqual(initialStartDuration, 10)
    }
    
}
