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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var journal = Journal()
        print(journal.entries[0].content!)
    }
}
