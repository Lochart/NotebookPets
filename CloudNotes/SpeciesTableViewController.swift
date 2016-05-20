//
//  SpeciesTableViewController.swift
//  CloudNotes
//
//  Created by Nikolay on 18.05.16.
//  Copyright © 2016 Ray Wenderlich. All rights reserved.
//

import UIKit
import CoreData

class SpeciesTableViewController: UITableViewController {

    var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = NSBundle.mainBundle().pathForResource("SpeciesPets", ofType: "plist")
   
        let dict = NSDictionary(contentsOfFile: path!)
        
        tableData = dict!.objectForKey("Scpecies") as! [String]    
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellSpecie", forIndexPath: indexPath) 

        cell.textLabel!.text = tableData[indexPath.row]
        
 

        return cell
    }
    
    // MARK: - Navigation

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "editNamePat" {
//            
////            if let navController = segue.destinationViewController as? UINavigationController {
////                if let nextViewController = navController.topViewController as? CreateNoteViewController {
////                    let path = tableView.indexPathForSelectedRow
////                    let cell = tableView.cellForRowAtIndexPath(path!)
////                    nextViewController.labelSpecieText = (cell?.textLabel?.text!)!
////                }
////            }
//
//
//            if let detailView = segue.destinationViewController as? CreateNoteViewController {
//              let path = tableView.indexPathForSelectedRow
//                let cell = tableView.cellForRowAtIndexPath(path!)
//                detailView.labelSpecieText == (cell?.textLabel?.text!)!
//            }
//        }
//    }
}