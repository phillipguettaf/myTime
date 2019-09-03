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
    private var mood:Mood?
    private var content:String?
    
    init() {
        CREATION_DATE = Date()
        mood = nil
        content = nil
    }
    
}
