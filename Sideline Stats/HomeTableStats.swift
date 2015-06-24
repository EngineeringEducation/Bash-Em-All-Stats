//
//  HomeTableStats.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/11/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class HomeTableStats: UITabBarController, UITableViewDelegate, UITableViewDataSource {
   
    let dataClass = DataClass()
    
    override func viewDidLoad() {
    
        println(dataClass.awayJammers.count)
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataClass.awayJammers.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        var part1 = dataClass.awayJammers[indexPath.row].number
        var part2 = dataClass.awayJammers[indexPath.row].percentWasLead
        var part3 = dataClass.awayJammers[indexPath.row].pointDifferential
        
        cell.textLabel?.text = "Jammer \(part1) | Lead % \(part2) | part3)"
        
        return cell
        
    }

    
}
