//
//  dataClass.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/8/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class DataClass: NSObject {
    
    //  Where in the array everything is (columns). The Jam is the row.
    
    var currentJamInt = 1
    var currentJamIndex = 0
    var currentJammerHome:String?
    var currentJammerAway: String?
    var currentLead:String?
    var currentScoreHome = 0
    var currentScoreAway = 0
    var homeScoreForJam:Int = 0
    var awayScoreForJam:Int = 0
    
    var jamData: [Jam] = []
    var homeJammers:[Jammers] = []
    var awayJammers:[Jammers] = []
    
    var jammers:Jammers!
    var jam:Jam!
    
    func currentJam() -> Int {
        
        return currentJamInt
        
    }
    
    func addJamNumberToArray() {
        
        var newJam = Jam()
        
        newJam.jamNumber = currentJamInt
        println("\(newJam.jamNumber) = \(currentJamInt)")
        jamData.append(newJam)
        
    }
    
    func addJammersToDataArray(home:String, away:String) {
        
        currentJamIndex = currentJamInt - 1
        jamData[currentJamIndex].homeJammer = home
        jamData[currentJamIndex].awayJammer = away
      
    }
    
    func addWhoWasLeadToArray(team: String) {
        
        jamData[currentJamIndex].didGetLead = team
        
    }
    
    func calculateScores(home: Int, away: Int) {
        
        homeScoreForJam = home - currentScoreHome
        awayScoreForJam = away - currentScoreAway
        
        jamData[currentJamIndex].jamHomePoints = homeScoreForJam
        jamData[currentJamIndex].jamAwayPoints = awayScoreForJam
        
        currentScoreHome = home
        currentScoreAway = away
        
        println(currentScoreHome)
        println(currentScoreAway)
        
    }
    
    func addJammerToJammerArray(team: String, jammer: String) {
        
        //FIX: Right now can have duplicate jammers
        
        //TODO: Need to 1) search for existing jammer in current array. If not in array, need to 2) create new object with jammer number and then 3) append it to the home (or away) jammer array
        
        var newJammer = Jammers()
        
        for var i = 0; i < homeJammers.count; ++i {
            
            
            
        }
        
    }
    
    func populateHomeDataArray() {
                
        for var i = 0; i < homeJammers.count; ++i {
            
            if homeJammers[i].number == currentJammerHome {
        
                if currentLead == "home" {
                        homeJammers[i].lead = homeJammers[i].lead + 1
                    } else {
                        homeJammers[i].notLead = homeJammers[i].notLead + 1
                    }
                }

                homeJammers[i].pointsFor = homeJammers[i].pointsFor + homeScoreForJam
                homeJammers[i].pointsAgainst = homeJammers[i].pointsAgainst + awayScoreForJam
                
                println("home - %lead \(homeJammers[i].percentWasLead) and ptdiff \(homeJammers[i].pointDifferential)")
            }
        
    }
    
    func populateAwayDataArray() {
        
        for var i = 0; i < awayJammers.count; ++i {
            
            if awayJammers[i].number == currentJammerAway {
                
                if currentLead == "away" {
                    awayJammers[i].lead = awayJammers[i].lead + 1
                } else {
                    awayJammers[i].notLead = awayJammers[i].notLead + 1
                }
                
                awayJammers[i].pointsFor = awayJammers[i].pointsFor + awayScoreForJam
                awayJammers[i].pointsAgainst = awayJammers[i].pointsAgainst + homeScoreForJam
               
                
                println("away - % lead \(awayJammers[i].percentWasLead) and diff \(awayJammers[i].pointDifferential)")
            }
        }
    }
    
}