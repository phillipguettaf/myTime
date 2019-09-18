//
//  JournalMonthView.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class JournalMonthView: UIViewController {
    
    @IBOutlet weak var months: UICollectionView!
    @IBOutlet weak var yearPicker: UIPickerView!
    
    
    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.journal = Journal()
        months.delegate = self
        months.dataSource = self
        yearPicker.delegate = self
        yearPicker.dataSource = self
        months.register(MonthCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.journal = Journal()
        yearPicker.reloadAllComponents()
        months.reloadData()
    }
}

extension JournalMonthView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if let journalContents = journal {
                return journalContents.pages.count
            } else {
            return 1
        }
    }
}

extension JournalMonthView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let journalContents = journal {
            return String(Array(journalContents.pages.keys).sorted(by: >)[row])
        } else {
            return "No entries: start adding some!"
        }
}
}

extension JournalMonthView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems: Int
        if let journalContents = journal {
            let year = Array(journalContents.pages.keys).sorted(by: <)[yearPicker.selectedRow(inComponent: 0)]
            numberOfItems = journalContents.pages[year]?.count ?? 1
        } else {
            numberOfItems = 1
        }
        return numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = months.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MonthCell
        if let journalContents = journal {
            let year = Array(journalContents.pages.keys).sorted(by: <)[yearPicker.selectedRow(inComponent:0)]
            let month = Array(journalContents.pages[year]!.keys).sorted(by:<)[indexPath.row]
            let page = journalContents.pages[year]?[month]
            
            cell.monthPage = page
            
        } else {
            
        }
        return cell
    }
}
extension JournalMonthView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2 - 5), height: (collectionView.frame.height/3 - 5))
    }

}
    

