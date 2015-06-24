//
//  DashboardTableViewCell.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/22/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var homeJammerLabel: UILabel!
    @IBOutlet weak var homePercentLeadLabel: UILabel!
    @IBOutlet weak var homePointDifferentialLabel: UILabel!
    @IBOutlet weak var awayJammerLabel: UILabel!
    @IBOutlet weak var awayPercentLeadLabel: UILabel!
    @IBOutlet weak var awayPointDifferentialLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
