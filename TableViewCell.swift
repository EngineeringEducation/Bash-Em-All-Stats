//
//  TableViewController.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/17/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var middleJammerLabel: UILabel!
    @IBOutlet weak var homeJammerTextField: UITextField!
    @IBOutlet weak var awayJammerTextField: UITextField!
    @IBOutlet weak var homeJammerLabel: UIButton!
    @IBOutlet weak var awayJammerLabel: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        middleJammerLabel.text = "Jammer 1"
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}