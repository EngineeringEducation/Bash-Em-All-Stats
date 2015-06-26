//
//  StatsDashboardTableViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/22/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class StatsDashboardTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var homeScoreCurrent: UITextField!
    @IBOutlet weak var awayScoreCurrent: UITextField!
    @IBOutlet weak var dashboardStatsTableView: UITableView!
    var jammers:Jammers!
    var dataClass:DataClass!

    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardStatsTableView.reloadData()
        homeScoreCurrent.text = String(dataClass.currentScoreHome)
        awayScoreCurrent.text = String(dataClass.currentScoreAway)
        homeScoreCurrent.enabled = false
        awayScoreCurrent.enabled = false

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if dataClass.homeJammers.count < dataClass.awayJammers.count {
            
            return (dataClass.awayJammers.count)
            
        } else {
            
            return (dataClass.homeJammers.count)
            
        }

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! DashboardTableViewCell

        cell.homeJammerLabel.text = dataClass.homeJammers[indexPath.row].number
        cell.homePercentLeadLabel.text = String(stringInterpolationSegment: dataClass.homeJammers[indexPath.row].percentWasLead)
        cell.homePointDifferentialLabel.text = String(dataClass.homeJammers[indexPath.row].pointDifferential)
        
        cell.awayJammerLabel.text = dataClass.awayJammers[indexPath.row].number
        cell.awayPercentLeadLabel.text = String(stringInterpolationSegment: dataClass.awayJammers[indexPath.row].percentWasLead)
        cell.awayPointDifferentialLabel.text = String(dataClass.awayJammers[indexPath.row].pointDifferential)
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ChooseJammersSegue" {
            
            if let destinationVC = segue.destinationViewController as? ChooseJammersViewController {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
            
        }
    }



}
