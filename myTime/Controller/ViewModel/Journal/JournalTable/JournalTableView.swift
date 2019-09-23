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
    
    var thereIsCellTapped = false
    var selectedRowIndex = -1
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        self.tableView.cellForRow(at: indexPath)?.backgroundColor = .gray
        self.tableView.cellForRow(at: indexPath)?.textLabel?.text = month!.page[indexPath.row].content

        // avoid paint the cell is the index is outside the bounds
        if self.selectedRowIndex != -1 {
            self.tableView.cellForRow(at: IndexPath(row: self.selectedRowIndex, section: 0))?.backgroundColor = .white
        }

        if selectedRowIndex != indexPath.row {
            self.thereIsCellTapped = true
            self.selectedRowIndex = indexPath.row
        } else {
            // there is no cell selected anymore
            self.thereIsCellTapped = false
            self.selectedRowIndex = -1
        }

        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex && thereIsCellTapped {
            return 144
        }
        self.tableView.cellForRow(at: indexPath)?.textLabel?.text = ""
        return 50
    }
    
}
