//
//  JournalEntryView.swift
//  myTime
//
//  Created by Phillip Guettaf on 17/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JournalEntryView: UIViewController, UIPopoverPresentationControllerDelegate, MoodSelectDelegate {

    @IBOutlet weak var journalEntryInput: UITextView!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var moodSelect: UIBarButtonItem!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationBar!
    
    var mood:Float?
    var content:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navbar.setBackgroundImage(UIImage(),for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
    }
    
    // Prepare data for the mood selector
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moodPopover" {
            let popOverViewController = segue.destination as! MoodOptionView
            popOverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popOverViewController.popoverPresentationController!.delegate = self
            popOverViewController.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
    // Force popover style
    return UIModalPresentationStyle.none
    }
    
    //Implemlent selectMood protocol method to update mood
    func selectMood(mood: Float, image: String) {
        self.mood = mood
        moodSelect.image = UIImage(named: image)
    }
    
    // Save journal entry
    @IBAction func onSubmit(_ sender: Any) {
        // Check if mood is selected
        if let actualMood = mood {
            self.content = journalEntryInput.text!
            let currentDate = Date()
            let entry = JournalEntry(context: JournalContainer.context)
            
            entry.content = content
            entry.mood = actualMood
            entry.timeStamp = currentDate as NSDate
            // Save information to container and dismiss the view
            Journal.journal.entries.append(entry)
            Journal.journal.updateJournal(Journal.journal.entries)
            
            CloudStorage.shared.create(journalToSave: Journal.journal.entries)
            JournalContainer.saveContext()
            self.dismiss(animated: true, completion: nil)
            
        } else {
            // Alert the user that they haven't selected a mood
            let alert = UIAlertController(title: "Please select a mood", message: "How does this entry make you feel?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Return", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion:nil)
        }
    }
}

