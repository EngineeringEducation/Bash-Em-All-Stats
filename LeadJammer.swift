//
//  LeadJammer.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/4/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//
import UIKit

class LeadJammer:UIViewController {
    
    //TODO: Add field displaying current lead
    
    @IBOutlet var leadJammerMessage: UILabel!
    var leadJammerTeam:String = ""
    
    var jammers:Jammers!
    var dataClass:DataClass!
    
    override func viewWillAppear(animated: Bool) {
    }
    
    
    @IBAction func homeIsLead(sender: AnyObject) {
        
        if leadJammerTeam == "" || leadJammerTeam == "away" {
            leadJammerTeam = "home"
            
        } else if leadJammerTeam == "home" {
            leadJammerTeam = ""
            
        }
        
        displayLeadJammerMessage(leadJammerTeam)
    }
   
    
    @IBAction func awayIsLead(sender: AnyObject) {
    
        if leadJammerTeam == "" || leadJammerTeam == "home" {
            leadJammerTeam = "away"
            
        } else if leadJammerTeam == "away" {
            leadJammerTeam = ""
            
        }
        
        displayLeadJammerMessage(leadJammerTeam)
    }
    
    func displayLeadJammerMessage(var lead:String) {
        
        if leadJammerTeam != "" {

            leadJammerMessage.text = "Lead Jammer: " + lead
            
        } else {
            
            leadJammerMessage.text = "No Lead"
            
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillAppear(animated)
        dataClass.addWhoWasLeadToArray(leadJammerTeam)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowScorePageSegue" {
            
            if let destinationVC = segue.destinationViewController as? TrackScore {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
            
        }
        
    }
    
    
    
}