//
//  addJammers.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/3/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//


import UIKit

class Jammers: NSObject {
    
//Append new jammer to the end of the string
//TODO: Check if the person is already in the array
//TODO: Add local storage
//TODO: Add some functionality to let them have different sessions. 
    
    
    var number : String = ""
    var lead:Float = 0
    var notLead:Float = 0
    var pointsFor = 0
    var pointsAgainst = 0
    var percentWasLead : Float {
        if (self.lead + self.notLead) != 0 {
            return (self.lead / (self.lead + self.notLead))
        } else {
        return 0
        }
    }
    var pointDifferential:Int {
        return (self.pointsFor - self.pointsAgainst)
    }
    
    override init(){
        
        
        
    }
    
}

    
