//
//  JournalEntry+CoreDataProperties.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//
//

import Foundation
import CoreData


extension JournalEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }

    @NSManaged public var content: String?
    @NSManaged public var entryID: UUID?
    @NSManaged public var mood: Float
    @NSManaged public var timeStamp: NSDate?

}
