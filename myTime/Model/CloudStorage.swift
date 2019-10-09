//
//  CloudStorage.swift
//  myTime
//
//  Created by Phillip Guettaf on 4/10/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class CloudStorage {
    
    private init() {}
    
    static let shared = CloudStorage()
    
    var journal: [JournalEntry] = [] {
        didSet {
            Journal.journal.updateJournal(self.journal)
        }
    }
    
    func configure() {
        FirebaseApp.configure()
    }
    
    func create(journalToSave: [JournalEntry]) {
    
        let dbReference = Firestore.firestore().collection("users")
        guard let id = UIDevice.current.identifierForVendor?.uuidString else {
            print("Unable to retrieve device identifier: cannot save journal to Firebase.")
            return
        }
        
        let userReference = dbReference.document(id)
        
        let sanitisedJournal = CloudStorage.shared.sanitiseJournalForCloud(journalToSave)
        
        userReference.setData(["journal": sanitisedJournal])
    }
    
    func sanitiseJournalForCloud(_ journal: [JournalEntry]) -> [Any] {
        var sanitisedJournal: [[String:Any]] = []
        
        for entry in journal {
            let sanitisedEntry: [String : Any] = [
                "mood": entry.mood,
                "content": entry.content!,
                "timestamp": entry.timeStamp!
            ]
            sanitisedJournal.append(sanitisedEntry)
        }
        return sanitisedJournal
    }
    
    func readOnLoad() {
        let dbReference = Firestore.firestore().collection("users")
        
        guard let id = UIDevice.current.identifierForVendor?.uuidString else {
            print("Unable to retrieve device identifier: cannot read journal from Firebase.")
            return
        }
        let userReference = dbReference.document(id)
        userReference.getDocument { (document, error) in
            if let document = document, document.exists {
                self.journal = CloudStorage.shared.convertCloudData(document.data()!)
                print("Journal retrieved from cloud")
                Journal.journal.updateJournal(self.journal)
            } else {
                print("No Firestore records associated with this device")
            }
        }
    }
    
    func convertCloudData(_ data: [String: Any]) -> [JournalEntry] {
        
        var localJournal: [JournalEntry] = []
        
        let cloudJournal = data["journal"] as? [[String: Any]]
        
        if let cloudJournal = cloudJournal {
            for entry in cloudJournal {
                let journalEntry = JournalEntry(context: JournalContainer.context)
                
                journalEntry.content = entry["content"] as? String
                journalEntry.mood = entry["mood"] as! Float
                let time = entry["timestamp"] as! Timestamp
                journalEntry.timeStamp = time.dateValue() as NSDate
                
                localJournal.append(journalEntry)
            }
        }
        return localJournal
    }
    
}
