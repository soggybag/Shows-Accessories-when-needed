//
//  ViewController.swift
//  Shows Accessories when needed
//
//  Created by mitchell hudson on 4/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // A struct. The caption value is a required, but not all 
    // items will have details, this is optional
    struct Item {
        let caption: String     // This property is required
        let details: String?    // This is optional
    }
    
    
    var array = [
        Item(caption: "Bugbear", details: "Bugbear details text"),
        Item(caption: "Thing with no details", details: nil),
        Item(caption: "Carrion Crawler", details: "The carrion crawler has lots of details."),
        Item(caption: "A Caption eludes to the detail text", details: "The details provide the rest"),
        Item(caption: "No caption", details: nil),
        Item(caption: "Something short", details: nil),
        Item(caption: "Actions: Morningstar", details: "Attack details..."),
        Item(caption: "Damage Resistances: radiant, bludgeoning, piercing, and slashing from nonmagical weapons", details: "Damage Resistances: radiant, bludgeoning, piercing, and slashing from nonmagical weapons")
    ]
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    // MARK: TableView Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        // Get the caption
        cell.textLabel?.text = array[indexPath.row].caption
        
        // Check for details. If a cell has details set the Disclosure indicator
        // and the selection style for that cell.
        
        if array[indexPath.row].details != nil {        // There are details
            cell.accessoryType = .DisclosureIndicator   // Show detail disclosure
            cell.selectionStyle = .Default              // Set the selection type
        } else {                        // No details
            cell.accessoryType = .None  // no accessory for this cell
            cell.selectionStyle = .None // The cell is not selectable
        }
        
        return cell
    }
    
    
    // MARK: Table view Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if array[indexPath.row].details != nil {
            performSegueWithIdentifier("toDetailsSegue", sender: self)
        }
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailsSegue" {
            // If we're going to details the segue better be this one!
            let vc = segue.destinationViewController as! DetailsViewController
            // Get the indexpath for the selected cell and details from the array
            vc.detailsText = array[tableView.indexPathForSelectedRow!.row].details
        }
    }
 
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




