//
//  ViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 5/28/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

//TODO: Make sure there are two selections before letting them go to the next screen
//TODO: put cursor in field after selecting "add new"
//TODO: do text input hidey stuffs.

import UIKit

class SidelineStats: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var newHomeJammerField: UITextField!
    @IBOutlet weak var newAwayJammerField: UITextField!
    @IBOutlet weak var homeJammerTable: UITableView!
    @IBOutlet weak var awayJammerTable: UITableView!
    @IBOutlet weak var saveHomeJammerOutlet: UIButton!
    @IBOutlet weak var saveAwayJammerOutlet: UIButton!
    
    //var homeFetchedResultController:
    
    //var tableView = UITableView()
    //I had this ^^ in another program, but adding it didn't seem to do anthing.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newHomeJammerField.hidden = true
        newAwayJammerField.hidden = true
        saveHomeJammerOutlet.hidden = true
        saveAwayJammerOutlet.hidden = true
        
        //self.homeJammerTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //self.awayJammerTable.registerClass(UITableViewCell.self,  forCellReuseIdentifier: "cell2")
        
    }

    //TODO: Auto-select jammer that was just added
    //TODO: store current jammer somewhere
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Show the fields to add the jammer if they select "add jammer"
    @IBAction func addHomeJammer(sender: AnyObject) {
        
        newHomeJammerField.hidden = false
        saveHomeJammerOutlet.hidden = false
        
    }

    @IBAction func addAwayJammer(sender: AnyObject) {
        
        newAwayJammerField.hidden = false
        saveAwayJammerOutlet.hidden = false
    }
    
    @IBAction func saveHomeJammer(sender: AnyObject) {
        
        AddJammers().addNewHomeJammer(newHomeJammerField.text)
        homeJammerTable.reloadData()
        println(homeJammers.count)
        
    }
    
    @IBAction func saveAwayJammer(sender: AnyObject) {
        
        AddJammers().addNewAwayJammer(newAwayJammerField.text)
        awayJammerTable.reloadData()
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == homeJammerTable) && homeJammers.count != 0 {
        
            println("tableview home count")
            return homeJammers.count

        } else if tableView == awayJammerTable && awayJammers.count != 0 {
            
            println("tableview away count")
            return awayJammers.count
            
        } else {
            
            return 0
            
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView == homeJammerTable {
        
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
            cell.textLabel?.text = homeJammers[indexPath.row]
            
            println("table cell home")
            return cell
        
        } else {
            
            let cell2 = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
            
            cell2.textLabel?.text = awayJammers[indexPath.row]
            
            println("table cell away")
            return cell2
            
        }

        
    }

    
    


}
