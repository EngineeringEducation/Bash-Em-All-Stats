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
    let  jamNumberColumn = 0
    let jammerHomeColumn = 1
    let jammerAwayColumn = 2
    let       didGetLead = 3
    let     ptsInJamHome = 4
    let     ptsInJamAway = 5
    
    var currentJamInt = 1
    var currentJammerHome:String = String()
    var currentJammerAway: String = String()
    var currentLead:String = String()
    var currentScoreHome = 0
    var currentScoreAway = 0
    var homeScoreForJam:Int = Int()
    var awayScoreForJam:Int = Int()
    
    var dataArray = Array(count: 6, repeatedValue: Array(count: 10, repeatedValue: String()))
    var homeJammers:[Jammers] = []
    var awayJammers:[Jammers] = []
    
    var jammers:Jammers! = Jammers()
    
    func currentJam() -> Int {
        
        return currentJamInt
        
    }
    
    func addJamNumberToArray() {
        
        dataArray[jamNumberColumn][currentJamInt-1] = String(currentJamInt)
        
    }
    
    func addJammersToArray(home:String, away:String) {
        
        dataArray[jammerHomeColumn][currentJamInt-1] = home
        dataArray[jammerAwayColumn][currentJamInt-1] = away
        
    }
    
    func addWhoWasLeadToArray(team: String) {
        
        dataArray[didGetLead][currentJamInt-1] = team
        
    }
    
    func calculateScores(home: Int, away: Int) {
        
        homeScoreForJam = home - currentScoreHome
        awayScoreForJam = away - currentScoreAway
        
        dataArray[ptsInJamHome][currentJamInt-1] = toString(homeScoreForJam)
        dataArray[ptsInJamAway][currentJamInt-1] = toString(awayScoreForJam)
        
        currentScoreHome = home
        currentScoreAway = away
        
        println(currentScoreHome)
        println(currentScoreAway)
        
    }
    
    func addJammerToJammerArray(team: String, newJammer: String) {
        
        //FIX: Right now you can't have the same number on both teams. 
        
        if team == "home" {
            
            if jammers.number != newJammer  {
            
                jammers.number = newJammer
                jammers.lead = 0
                jammers.notLead = 0
                jammers.pointsFor = 0
                jammers.pointsAgainst = 0
                jammers.percentWasLead = 0
                jammers.pointDifferential = 0
                homeJammers.append(jammers)
                println("I added a home jammer to the array")
                
            }
            
        } else if team == "away" {
        
            if jammers.number != newJammer {
                    
                jammers.number = newJammer
                jammers.lead = 0
                jammers.notLead = 0
                jammers.pointsFor = 0
                jammers.pointsAgainst = 0
                jammers.percentWasLead = 0
                jammers.pointDifferential = 0
                awayJammers.append(jammers)
                println("I added an away jammer to the array")
            }
        }
    }
    
    func populateDataArray() {
                
        if jammers.number == currentJammerHome {
            if currentLead == "home" {
                jammers.lead++
            } else {
                jammers.notLead++
            }
        jammers.pointsFor = jammers.pointsFor + homeScoreForJam
        jammers.pointsAgainst = jammers.pointsAgainst + awayScoreForJam
        jammers.percentWasLead = Float(jammers.lead / (jammers.lead + jammers.notLead))
        jammers.pointDifferential = jammers.pointsFor - jammers.pointsAgainst
        
        println("test \(jammers.percentWasLead) and test \(jammers.pointDifferential)")
    }
    }
    
}