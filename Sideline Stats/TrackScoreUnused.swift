//
//  TrackScore.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/5/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class TrackScore:UIViewController {
    
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var homeScoreStepperOutlet: UIStepper!
    @IBOutlet weak var awayScoreStepperOutlet: UIStepper!
    var awayCurrentScore:Int = Int()
    var homeCurrentScore:Int = Int()
    
    var jammers:Jammers!
    var dataClass:DataClass!
    
    @IBAction func homeScoreAdjustStepper(sender: UIStepper) {
        
        homeScoreLabel.text = sender.value.description
        homeCurrentScore++
        
    }

    
    @IBAction func awayScoreAdjustStepper(sender: UIStepper) {
        
        awayScoreLabel.text = sender.value.description
        awayCurrentScore++
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        homeCurrentScore = dataClass.currentScoreHome
        awayCurrentScore = dataClass.currentScoreAway
   
    }
    
    
    override func viewDidLoad() {
        
        homeScoreLabel.text = dataClass.currentScoreHome.description
        awayScoreLabel.text = dataClass.currentScoreAway.description
        
        homeScoreStepperOutlet.maximumValue = 600
        homeScoreStepperOutlet.minimumValue = Double(dataClass.currentScoreHome)
        
        awayScoreStepperOutlet.maximumValue = 600
        awayScoreStepperOutlet.minimumValue = Double(dataClass.currentScoreAway)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowJammerPageSegue" {
            
            if let destinationVC = segue.destinationViewController as? SidelineStats {
                
                destinationVC.jammers = jammers
                destinationVC.dataClass = dataClass
                
            }
            
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        dataClass.calculateScores(homeCurrentScore, away: awayCurrentScore)
        dataClass.currentJamInt++
        dataClass.populateHomeDataArray()
        dataClass.populateAwayDataArray()
        
        
    }
    
    
    
}
