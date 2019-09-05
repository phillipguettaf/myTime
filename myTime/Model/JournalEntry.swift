//
//  JournalEntry.swift
//  myTime
//
//  Created by Phillip Guettaf on 3/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

class JournalEntry {
    
    enum Mood:Float {
        case verysad = 0.0
        case sad = 1.0
        case happy = 2.0
        case veryhappy = 3.0
    }
 
    let CREATION_DATE:Date
    var mood:Mood?
    var content:String?
    
    init() {
        self.CREATION_DATE = Date()
        self.mood = nil
        self.content = nil
    }
    
}
