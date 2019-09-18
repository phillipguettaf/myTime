//
//  MonthCell.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class MonthCell: UICollectionViewCell {
    var monthButton: MonthButton
    
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
        
        contentView.addSubview(monthButton)
        
//        monthButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        monthButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//        monthButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        monthButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        //self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
