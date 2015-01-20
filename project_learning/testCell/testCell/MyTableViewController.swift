//
//  MyTableViewController.swift
//  testCell
//
//  Created by Tony on 12/30/14.
//  Copyright (c) 2014 Tony. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    var label1: [String]!
    var label2: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1 = ["apple","peach","orange","banana"]
        label2 = ["apple","peach","orange","asdjflkajskfjlajsldkjflkajsdlfjlasjdlkfjlkasjdflkjalskdjflkjalskjflkjalskdjflkjasdlkjflkjasdlkjflkasjdklfjlkasdjlalksdjlfkjalkdsjflkjasdjlkasdjflka"]
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 102
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label1.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SelfSizingCell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as SelfSizingCell
        cell.titoloLabel.text = label1[indexPath.row]
        cell.titoloLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cell.descrLabel.text = label2[indexPath.row]
        cell.descrLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        return cell
    }

    
}
