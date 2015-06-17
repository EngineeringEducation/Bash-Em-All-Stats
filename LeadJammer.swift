//
//  LeadJammer.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/4/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//
import UIKit

enum teamThatIsLead : String {
    
    case Home = "Home"
    case Away = "Away"
    case None = "No Lead"
    
    init() {
        
        self = .None
    }
    
}

class LeadJammer:UIViewController {
    
    @IBOutlet var leadJammerMessage: UILabel!
    var leadJammerTeam:String = ""
    var leadTeam = teamThatIsLead()
    
    
    var jammers:Jammers!
    var dataClass:DataClass!
    
    func assignLeadTeam(var team: String) {
        
        if team == "home" {
            switch (leadTeam) {
            case .Home:
                leadTeam = .None
            default:
                leadTeam = .Home
            }
        } else {
            switch (leadTeam) {
            case .Away:
                leadTeam = .None
            default:
                leadTeam = .Away
            }
        }
        team = leadTeam.rawValue
        displayLeadJammerMessage(team)
    }
    
    @IBAction func homeIsLead(sender: AnyObject) {
        
        assignLeadTeam("home")
    }
   
    
    @IBAction func awayIsLead(sender: AnyObject) {
    
        assignLeadTeam("away")
        
    }
    
    func displayLeadJammerMessage(var lead:String) {
        
        leadJammerMessage.text = (leadTeam == teamThatIsLead.None) ? "None" : "Lead Jammer: " + lead
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillAppear(animated)
        dataClass.addWhoWasLeadToArray(leadJammerTeam)
        dataClass.currentLead = leadJammerTeam
        
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