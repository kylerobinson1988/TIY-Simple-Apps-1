//
//  ListTableViewController.swift
//  HighPriority
//
//  Created by Kyle Brooks Robinson on 5/11/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

enum Priority {
    case High
    case Medium
    case Low
}

class ListTableViewController: UITableViewController {
    @IBOutlet weak var yellowLowButton: priorityButton!
    @IBOutlet weak var orangeMediumButton: priorityButton!
    @IBOutlet weak var redHighButton: priorityButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    
    
   
    var priorityChoice = 0
    
    @IBAction func highPriority(sender: priorityButton) {
        priorityChoice = 0
        sender.selectedButton = true
        orangeMediumButton.selectedButton = false
        yellowLowButton.selectedButton = false
    }
    
    @IBAction func mediumPriority(sender: priorityButton) {
        priorityChoice = 1
        sender.selectedButton = true
        redHighButton.selectedButton = false
        yellowLowButton.selectedButton = false
    }
    
    @IBAction func lowPriority(sender: priorityButton) {
        priorityChoice = 2
        sender.selectedButton = true
        orangeMediumButton.selectedButton = false
        redHighButton.selectedButton = false
    }
    
    var listItems: [[String:AnyObject]] = [
        
//        [
//            "name": "Sleep in bed",
//            "timeCreated": NSDate(),
//            "priority": 0,
//            "completed": false
//        ],
//        [
//            "name":"Destroy enemies",
//            "timeCreated": NSDate(),
//            "priority": 1,
//            "completed": false
//        ],
//        
//    
//    
//    
    
    
    ]
    
    
    
    
    @IBOutlet weak var itemNameField: UITextField!
    
    
    @IBAction func createItem(sender: AnyObject) {
        
        var itemInfo = [
            "name": itemNameField.text,
            "timeCreated": NSDate(),
            "priority": priorityChoice,
            "completed": false
        
        ]
        
        listItems.insert(itemInfo, atIndex: 0)
        tableView.reloadData()
        itemTextField.text = ""
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        createButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listCell", forIndexPath: indexPath) as! ListTableViewCell
        
        
        cell.itemInfo = listItems[indexPath.row]
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            listItems.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
