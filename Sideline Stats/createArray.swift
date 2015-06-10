//
//  createArray.swift
//  Sideline Stats
//
//  Created by Caitlin on 6/8/15.
//  Copyright (c) 2015 Caitlin. All rights reserved.
//

import UIKit

class createArray: NSObject {
    
        var cols:Int, rows:Int
        var matrix:[String]
        
        
        init(cols:Int, rows:Int) {
            self.cols = cols
            self.rows = rows
            matrix = Array(count:cols*rows, repeatedValue:"")
        }
        
        subscript(col:Int, row:Int) -> String {
            get {
                return matrix[cols * row + col]
            }
            set {
                matrix[cols*row+col] = newValue
            }
        }
        
        func colCount() -> Int {
            return self.cols
        }
        
        func rowCount() -> Int {
            return self.rows
        }
}

