//
//  TableCell.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    var entry: JournalEntry? {
        didSet {
            var imageName: String
            switch entry!.mood {
                case 1.0:
                    imageName = "Mood1VSad.pdf"
                case 2.0:
                    imageName = "Mood2Sad.pdf"
                case 3.0:
                    imageName = "Mood3Medium.pdf"
                case 4.0:
                    imageName = "Mood4Happy.pdf"
                case 5.0:
                    imageName = "Mood5VHappy.pdf"
                default:
                    imageName = "Mood3Medium.pdf"
            }
            self.imageView?.image = UIImage(named: imageName)
        
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .none
            df.locale = Locale(identifier: "en_AU")
            let date = df.string(from: entry!.timeStamp! as Date)
            
            self.detailTextLabel?.text = date
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .value1, reuseIdentifier: "tablecell")
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

