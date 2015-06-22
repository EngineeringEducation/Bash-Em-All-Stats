//
//  ChooseJammersViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/20/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class ChooseJammersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeJammerTable: UITableView!
    @IBOutlet weak var awayJammerTable: UITableView!
    
    var selectedHomeJammer:String?
    var selectedAwayJammer:String?
    
    var jammers:Jammers!
    var dataClass:DataClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeJammerTable.reloadData()
        awayJammerTable.reloadData()
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == homeJammerTable {
            
            println(dataClass.homeJammers.count)
            return dataClass.homeJammers.count
            
        } else if tableView == awayJammerTable {
            
            println(dataClass.awayJammers.count)
            return dataClass.awayJammers.count
            
        } else {
            
            println("you shouldn't be here")
            return  0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")

        if tableView == homeJammerTable {
            
            cell.textLabel?.text = dataClass.homeJammers[indexPath.row].number
            
        } else if tableView == awayJammerTable {
            
            cell.textLabel?.text = dataClass.awayJammers[indexPath.row].number
            
        } else {
            
            "you shouldn't be here"
            
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView == homeJammerTable {
            
            dataClass.currentJammerHome = dataClass.homeJammers[indexPath.row].number
            selectedHomeJammer = dataClass.homeJammers[indexPath.row].number
            
        } else if tableView == awayJammerTable {
            
            dataClass.currentJammerAway = dataClass.awayJammers[indexPath.row].number
            selectedAwayJammer = dataClass.awayJammers[indexPath.row].number
            
            
        } else {
            
            
            println("you shouldn't be here")
            
        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if identifier == "TrackJamSegue" {
            
            if selectedAwayJammer != nil && selectedHomeJammer != nil {
                
                return true
                
            } else {
                
                return false
                
            }
        } else {
            
            return true
            
        }
        
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AddJammersSegue" {
            
            if let destinationVC = segue.destinationViewController as? SidelineStats {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
        
        } else if segue.identifier == "TrackJamSegue" {
                
                if let destinationVC = segue.destinationViewController as? LeadJammer {
                    
                    destinationVC.jammers = jammers
                    destinationVC.dataClass = dataClass
                    
            }
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        if dataClass.jamData.count < dataClass.currentJamInt {
            dataClass.addJamNumberToArray()
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        dataClass.currentJammerAway = selectedAwayJammer
        dataClass.currentJammerHome = selectedHomeJammer
        if selectedAwayJammer != nil && selectedHomeJammer != nil {
            dataClass.addJammersToDataArray(selectedHomeJammer!, away: selectedAwayJammer!)
        }
        println("current home jammer \(dataClass.currentJammerHome)")

        
    }
}


