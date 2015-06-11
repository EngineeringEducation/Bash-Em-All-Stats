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
    
    func addJammerToJammerArray(team: String, jammer: String) {
        
        //FIX: Right now you can't have the same number on both teams. 
        
        var newJammer = Jammers()
        
        if team == "home" {
            
            if newJammer.number != newJammer  {
            
                newJammer.number = jammer
                newJammer.lead = 0
                newJammer.notLead = 0
                newJammer.pointsFor = 0
                newJammer.pointsAgainst = 0
                newJammer.percentWasLead = 0
                newJammer.pointDifferential = 0
                homeJammers.append(newJammer)
                println("I added an home jammer to the array")
                
            }
            
        } else if team == "away" {
        
            if newJammer.number != newJammer {
                    
                newJammer.number = jammer
                newJammer.lead = 0
                newJammer.notLead = 0
                newJammer.pointsFor = 0
                newJammer.pointsAgainst = 0
                newJammer.percentWasLead = 0
                newJammer.pointDifferential = 0
                awayJammers.append(newJammer)
                println("I added an away jammer to the array")
            }
        }
    }
    
    func populateHomeDataArray() {
                
        for var i = 0; i < homeJammers.count; ++i {
            
            if homeJammers[i].number == currentJammerHome {
        
                if currentLead == "home" {
                        homeJammers[i].lead = homeJammers[i].lead! + 1
                    } else {
                        homeJammers[i].notLead = homeJammers[i].notLead! + 1
                }
                
                homeJammers[i].pointsFor = homeJammers[i].pointsFor + homeScoreForJam
                homeJammers[i].pointsAgainst = homeJammers[i].pointsAgainst + awayScoreForJam
                homeJammers[i].percentWasLead = homeJammers[i].lead! / (homeJammers[i].lead! + homeJammers[i].notLead!)
                homeJammers[i].pointDifferential = homeJammers[i].pointsFor - homeJammers[i].pointsAgainst
                
                println("home - %lead \(homeJammers[i].percentWasLead) and ptdiff \(homeJammers[i].pointDifferential)")
            }
        }
    }
    
    func populateAwayDataArray() {
        
        for var i = 0; i < awayJammers.count; ++i {
            
            if awayJammers[i].number == currentJammerAway {
                
                if currentLead == "away" {
                    awayJammers[i].lead = awayJammers[i].lead! + 1
                } else {
                    awayJammers[i].notLead = awayJammers[i].notLead! + 1
                }
                
                awayJammers[i].pointsFor = awayJammers[i].pointsFor + awayScoreForJam
                awayJammers[i].pointsAgainst = awayJammers[i].pointsAgainst + homeScoreForJam
                awayJammers[i].percentWasLead = awayJammers[i].lead! / (awayJammers[i].lead! + awayJammers[i].notLead!)
                awayJammers[i].pointDifferential = awayJammers[i].pointsFor - awayJammers[i].pointsAgainst
                
                println("away - % lead \(awayJammers[i].percentWasLead) and diff \(awayJammers[i].pointDifferential)")
            }
        }
    }
    
}