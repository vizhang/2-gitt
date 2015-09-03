//
//  SettingsTableViewController.swift
//  GithubDemo
//
//  Created by Victor Zhang on 9/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var starsSlider: UISlider!
    @IBOutlet weak var starsLabel: UILabel!
    var minStars: Int?
    
    @IBOutlet weak var languageFilterSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        starsSlider.value = Float(minStars!)
        starsLabel.text = String(minStars!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 1) {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
            
            // Configure the cell...
            
            return cell
        }
        
    }
    */
    
    // MARK: - Table view data source


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return trues
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    @IBAction func toggleLanguageFilter(sender: UIButton) {
        if languageFilterSwitch.on {
            println("turning on")

            
        } else {
            println("turning off")
        }
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let minStars = Int(sender.value)
        self.starsLabel.text = String(minStars)
        self.minStars = minStars
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
