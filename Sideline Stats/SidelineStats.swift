//
//  ViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 5/28/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

//TODO: put cursor in field after selecting "add new"
//TODO: do text input hidey stuffs.

import UIKit

class SidelineStats: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    // MARK: - Views
    @IBOutlet weak var newHomeJammerField: UITextField!
    @IBOutlet weak var newAwayJammerField: UITextField!
    @IBOutlet weak var homeJammerTable: UITableView!
    @IBOutlet weak var awayJammerTable: UITableView!
    @IBOutlet weak var saveHomeJammerOutlet: UIButton!
    @IBOutlet weak var saveAwayJammerOutlet: UIButton!
    @IBOutlet weak var chooseJammerLabel: UILabel!
    
    // MARK: - Models
    var selectedJammerHome:String = String()
    var selectedJammerAway:String = String()
    
    var jammers:Jammers! = Jammers()
    var dataClass:DataClass! = DataClass()
    
   
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newHomeJammerField.hidden = true
        newAwayJammerField.hidden = true
        saveHomeJammerOutlet.hidden = true
        saveAwayJammerOutlet.hidden = true
        
        homeJammerTable.reloadData()
        awayJammerTable.reloadData()
        
    }

    //TODO: Auto-select jammer that was just added
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Show the fields to add the jammer if they select "add jammer"
    @IBAction func addHomeJammer(sender: AnyObject) {
        
        newHomeJammerField.hidden = false
        saveHomeJammerOutlet.hidden = false
        
    }
    
    // Same for away.
    @IBAction func addAwayJammer(sender: AnyObject) {
        
        newAwayJammerField.hidden = false
        saveAwayJammerOutlet.hidden = false
    }
    
    // MARK: - Save New Jammers
    // Checks to see if the jammer is already in the array. If it is, then displays message to user. If not, then saves the new jammer to the list of jammers and then reloads the view to include the new jammer.
    @IBAction func saveHomeJammer(sender: AnyObject) {
        
        let newJammer = String(newHomeJammerField.text)
        dataClass.addJammerToJammerArray("home", jammer: newJammer)
        homeJammerTable.reloadData()
    
    }
    
    // Same, but for adding away jammers.
    @IBAction func saveAwayJammer(sender: AnyObject) {
        
        let newJammer = String(newAwayJammerField.text)
        dataClass.addJammerToJammerArray("away", jammer: newJammer)
        awayJammerTable.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == homeJammerTable) && dataClass.homeJammers.count != 0 {
        
            return dataClass.homeJammers.count
            

        } else if tableView == awayJammerTable && dataClass.awayJammers.count != 0 {
            
            return dataClass.awayJammers.count
            
        } else {
            
            return 0
        }
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == homeJammerTable {
        
            let cell = UITableViewCell(style: UITableViewCellStyle.Default,  reuseIdentifier: "Cell")

            cell.textLabel?.text = dataClass.homeJammers[indexPath.row].number
            
            return cell
        
        } else if tableView == awayJammerTable {
            
            let cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            
            cell2.textLabel?.text = dataClass.awayJammers[indexPath.row].number
            
            return cell2
            
        }
        
        let cell3 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        return cell3

    }
    
    override func viewWillDisappear(animated: Bool) {
    
        dataClass.addJammersToArray(selectedJammerHome,away: selectedJammerAway)
        dataClass.addJamNumberToArray()
        println(dataClass.dataArray)
    
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView == homeJammerTable {
            
            let indexPath = tableView.indexPathForSelectedRow()
            let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
            if currentCell.textLabel?.text != nil {
                selectedJammerHome = currentCell.textLabel!.text!
                dataClass.currentJammerHome = currentCell.textLabel!.text!
            } else {
                println("nothing here home")
            }
            
        } else {
            
            let indexPath = tableView.indexPathForSelectedRow()
            let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
            if currentCell.textLabel?.text != nil {
                selectedJammerAway = currentCell.textLabel!.text!
                dataClass.currentJammerAway = currentCell.textLabel!.text!
            } else {
                println("nothing here away")
            }

        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if selectedJammerHome.isEmpty == true || selectedJammerAway.isEmpty == true {
            
            chooseJammerLabel.text = "Please choose a jammer for each team"
            println("nope, won't happen")
            return false
            
            
        }
        
        return true
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "ShowLeadPageSegue" {
            
            if let destinationVC = segue.destinationViewController as? LeadJammer {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
            
        }
    
    }

}
