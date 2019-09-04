//
//  JournalEntry.swift
//  myTime
//
//  Created by Phillip Guettaf on 3/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation

class JournalEntry {
    
    enum Mood {
        case verysad, sad, happy, veryhappy
    }
 
    private let CREATION_DATE:Date
    private var mood:Mood? {
        get {
            return self.mood
        }
        set(newMood) {
            self.mood = newMood
        }
    }
    private var content:String?
    
    init() {
        self.CREATION_DATE = Date()
        self.mood = nil
        self.content = nil
    }
    
}
