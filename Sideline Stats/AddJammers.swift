//
//  addJammers.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/3/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

var homeJammers:[String] = []
var awayJammers:[String] = []


class AddJammers:SidelineStats {
    
    
//Append new jammer to the end of the string
//TODO: Check if the person is already in the array
//TODO: Add local storage
//TODO: Add some functionality to let them have different sessions. 
    
    func addNewHomeJammer(newHomeJammer: String) {
        
        homeJammers.append(newHomeJammer)
        println(homeJammers)
        
    }
    
    func addNewAwayJammer(newAwayJammer: String) {
        
        awayJammers.append(newAwayJammer)
        println(awayJammers)
    }

//Return the # of jammers in each array
    
    func countHomeJammers() -> Int {
        
        return homeJammers.count
        
    }
    
    func countAwayJammers() -> Int {
        
        return awayJammers.count
        
    }
    
}
    
