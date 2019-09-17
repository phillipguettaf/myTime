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
    
    var mood:Float?
    var content:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
    
    func selectMood(mood: Float, image: String) {
        self.mood = mood
        moodSelect.image = UIImage(named: image)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if let actualMood = mood {
            self.content = journalEntryInput.text!
            let currentDate = Date()
            let entry = JournalEntry(context: JournalContainer.context)
            
            entry.content = content
            entry.mood = actualMood
            entry.timeStamp = currentDate as NSDate
            
            JournalContainer.saveContext()
            self.dismiss(animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Please select a mood", message: "How does this entry make you feel?", preferredStyle: .alert)
            let action = UIAlertAction(title: "Return", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion:nil)
        }
    }
}

extension JournalEntryView: UITextViewDelegate {
    
}
