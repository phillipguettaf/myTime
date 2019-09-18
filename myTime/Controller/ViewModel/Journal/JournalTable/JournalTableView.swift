//
//  JournalTable.swift
//  myTime
//
//  Created by Phillip Guettaf on 18/9/19.
//  Copyright © 2019 RMIT. All rights reserved.
//

import Foundation
import UIKit

class JournalTableView: UITableViewController, TableViewDelegate {
    
    func segue(month: JournalPage) {
        self.month = month
    }
    
    
    @IBOutlet var table: UITableView!
    
    var month: JournalPage?
    var delegate: TableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(TableCell.self, forCellReuseIdentifier: "tablecell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month!.page.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableCell
        if month != nil {
            cell.entry = month!.page[indexPath.row]
        }
        return cell
    }

    
}
