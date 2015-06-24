//
//  ViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 5/28/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

//TODO: put cursor in field after selecting "add new"
//TODO: do text input hidey stuffs.

import UIKit

class SidelineStats: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var homeJammerTable: UITableView!
    
    // MARK: - Models
    var selectedJammerHome:String = String()
    var selectedJammerAway:String = String()
    
    var jammers:Jammers! = Jammers()
    var dataClass:DataClass! = DataClass()
   
    override func viewWillAppear(animated: Bool) {
      
        homeJammerTable.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let cellValue = textField.text
        
        let visibleCells = self.homeJammerTable.visibleCells() as! [TableViewCell]
        
        var cellWhichContainsThisTextField : TableViewCell!
        
        for cell in visibleCells {
            if textField.isDescendantOfView(cell) {
                cellWhichContainsThisTextField = cell
            }
        }
        
        let cellIndexPath = self.homeJammerTable.indexPathForCell(cellWhichContainsThisTextField)
        
        println("index path: \(cellIndexPath)")
        
        if textField == cellWhichContainsThisTextField.homeJammerTextField {
            
            dataClass.addJammerToJammerArray("home", jammer: cellValue)
 
            
        } else if textField == cellWhichContainsThisTextField.awayJammerTextField {
            
            dataClass.addJammerToJammerArray("away", jammer: cellValue)
            
        } else {
            println("You shouldn't be here")
        }
        
        homeJammerTable.reloadData()
        return true
    }

    //TODO: Auto-select jammer that was just added
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if dataClass.homeJammers.count < dataClass.awayJammers.count {
            
            return (dataClass.awayJammers.count + 1)
            
        } else {
            
            return (dataClass.homeJammers.count + 1)
            
        }
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell") as! TableViewCell

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")as! TableViewCell
        
        cell.middleJammerLabel.text = "Jammer \(indexPath.row + 1)"
        
        if dataClass.homeJammers.count > indexPath.row {
        
            
                if dataClass.homeJammers[indexPath.row].number == "" {
                    
                    cell.homeJammerTextField.hidden = false
                    cell.homeJammerLabel.hidden = true
                
                } else {
                    
                    cell.homeJammerTextField.hidden = true
                    cell.homeJammerLabel.hidden = false
                    cell.homeJammerLabel.setTitle(dataClass.homeJammers[indexPath.row].number, forState: .Normal)
                    
                }

        } else {
            
            cell.homeJammerTextField.hidden = false
            cell.homeJammerLabel.hidden = true
            
        }
        
        if dataClass.awayJammers.count > indexPath.row {

       
            if dataClass.awayJammers[indexPath.row].number == "" {
                
                cell.awayJammerTextField.hidden = false
                cell.awayJammerLabel.hidden = true
                
            } else {
                
                cell.awayJammerTextField.hidden = true
                cell.awayJammerLabel.hidden = false
                cell.awayJammerLabel.setTitle(dataClass.awayJammers[indexPath.row].number, forState: .Normal)
                
            }
       
        } else {
            
            cell.awayJammerTextField.hidden = false
            cell.awayJammerLabel.hidden = true
            
        }
        
        cell.homeJammerTextField.delegate = self
        cell.awayJammerTextField.delegate = self

 
        return cell

    }
    
    override func viewWillDisappear(animated: Bool) {
    
        if dataClass.jamData.count < dataClass.currentJamInt {
            dataClass.addJamNumberToArray()
        }
        println(dataClass.homeJammers.count)
        dataClass.addJammersToDataArray(selectedJammerHome,away: selectedJammerAway)
    
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
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
}
