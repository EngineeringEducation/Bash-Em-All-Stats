//
//  LeadJammer.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/4/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//
import UIKit

enum teamThatIsLead : String {
    
    case Home = "home"
    case Away = "away"
    case None = "No Lead"
    
    init() {
        
        self = .None
    }
    
}

class LeadJammer:UIViewController, UITextFieldDelegate{
    
//    @IBOutlet var leadJammerMessage: UILabel!
    var leadJammerTeam:String = ""
    var leadTeam = teamThatIsLead()
    var awayCurrentScore:Int?
    var homeCurrentScore:Int?
    
    @IBOutlet weak var homeScoreUITextField: UITextField!
    @IBOutlet weak var awayScoreUITextField: UITextField!
    @IBOutlet weak var homeCurrentJammerLabel: UILabel!
    @IBOutlet weak var homeJammerIsLeadUIButton: UIButton!
    @IBOutlet weak var awayCurrentJammerLabel: UILabel!
    @IBOutlet weak var awayJammerIsLeadUIButton: UIButton!
    
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
//        displayLeadJammerMessage(team)
    }
    
    func editColorToReflectLead() {
        
        switch (leadTeam) {
            
        case .Home:
            homeJammerIsLeadUIButton.backgroundColor = UIColor.purpleColor()
            awayJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
            homeJammerIsLeadUIButton.selected = true
            awayJammerIsLeadUIButton.selected = false
            
        case .Away:
            awayJammerIsLeadUIButton.backgroundColor = UIColor.purpleColor()
            homeJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
            awayJammerIsLeadUIButton.selected = true
            homeJammerIsLeadUIButton.selected = false
        default:
            awayJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
            homeJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
            awayJammerIsLeadUIButton.selected = false
            homeJammerIsLeadUIButton.selected = false
        }
        
        
        
    }
    
    @IBAction func homeIsLead(sender: AnyObject) {
        
        assignLeadTeam("home")
        editColorToReflectLead()
    }
   
    
    @IBAction func awayIsLead(sender: AnyObject) {
    
        assignLeadTeam("away")
        editColorToReflectLead()
        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        println(dataClass.currentScoreHome)
        homeScoreUITextField.delegate = self
        awayScoreUITextField.delegate = self
//        awayScoreUITextField.text = dataClass.currentScoreAway.description
        homeCurrentScore = dataClass.currentScoreHome
        awayCurrentScore = dataClass.currentScoreAway
        println("home \(homeCurrentScore)")
        homeJammerIsLeadUIButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        awayJammerIsLeadUIButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        homeJammerIsLeadUIButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
        awayJammerIsLeadUIButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
        homeJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
        awayJammerIsLeadUIButton.backgroundColor = UIColor.grayColor()
        homeCurrentJammerLabel.text = dataClass.currentJammerHome
        awayCurrentJammerLabel.text = dataClass.currentJammerAway

    
    }
    
    override func viewDidLoad() {
        
        homeScoreUITextField.text = dataClass.currentScoreHome.description
        awayScoreUITextField.text = dataClass.currentScoreAway.description
    }
    
    
    @IBAction func editHomeScore(sender: UITextField) {
        
    }
    
    @IBAction func editAwayScore(sender: UITextField) {
        
    }
    
    //TODO: Need to make sure they only put in Ints into the score textfields. Right now not protecting from that at all.
    //TODO: Right now you HAVE to push enter. Need to detect that or protect against it?
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == homeScoreUITextField {
            
            homeCurrentScore = textField.text.toInt()
            
        } else if textField == awayScoreUITextField {
            
            awayCurrentScore = textField.text.toInt()
            
        }
        return true
        
    }
    

    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillAppear(animated)
        leadJammerTeam = leadTeam.rawValue
        dataClass.addWhoWasLeadToArray(leadJammerTeam)
        dataClass.currentLead = leadJammerTeam
        dataClass.calculateScores(homeCurrentScore!, away: awayCurrentScore!)
        dataClass.currentJamInt++
        dataClass.populateHomeDataArray()
        dataClass.populateAwayDataArray()
        println(dataClass.jamData)

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ChooseJammersSegue" {
            
            if let destinationVC = segue.destinationViewController as? ChooseJammersViewController {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
            
        } else if segue.identifier == "ShowDashboardSegue" {
            
            if let destinationVC = segue.destinationViewController as? StatsDashboardTableViewController {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
        }
        
    }

}