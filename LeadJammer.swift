//
//  LeadJammer.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/4/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//
import UIKit

class LeadJammer:SidelineStats {
    
    //TODO: Add field displaying current lead
    
    var leadJammerTeam = "test"
    @IBOutlet var leadJammerMessage: UILabel!
    
    @IBAction func homeIsLead(sender: AnyObject) {
        
        if leadJammerTeam.isEmpty {
            
            leadJammerTeam = "home"
            
        } else if leadJammerTeam == "home" {
            
            leadJammerTeam = ""
            
        }
        
        displayLeadJammerMessage(leadJammerTeam)
    
    }
   
    
    @IBAction func awayIsLead(sender: AnyObject) {
    
        if leadJammerTeam.isEmpty {
            
            leadJammerTeam = "away"
            
        } else if leadJammerTeam == "away" {
            
            leadJammerTeam = ""
            
        }
        
        displayLeadJammerMessage(leadJammerTeam)
    
    }
    
    func displayLeadJammerMessage(var lead:String) {
        
        leadJammerMessage.text = ("Lead Jammer: \(lead)")
        
    }
    
    
    
}