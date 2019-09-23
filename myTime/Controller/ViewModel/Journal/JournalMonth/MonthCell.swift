//
//  MonthCell.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class MonthCell: UICollectionViewCell, TableViewDelegate {
    
    var monthButton: MonthButton
    var tableDelegate: TableViewDelegate?
    
    var monthPage: JournalPage? {
        didSet {
            guard let month = monthPage else {return}
            monthButton.monthPage = month
        }
    }
    
    override init(frame: CGRect) {
 
        monthButton = MonthButton()
        let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
        super.init(frame: rect)
        monthButton.tableDelegate = self
        
        contentView.addSubview(monthButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func segue(month: JournalPage) {
        tableDelegate!.segue(month: monthPage!)
    }
}
