//
//  Student.swift
//  Attendance2.0
//
//  Created by Panucci, Julian R on 6/21/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Student {
    
    var name: String
    var picture: UIImage?
    var id: String
    var totalClasses: Int
    
    init(name: String, id: String) {
        self.name = name;
        self.id = id
        self.totalClasses = 0
    }
    
    init(snapshot: FIRDataSnapshot) {
        let values = snapshot.value as! NSDictionary
        
        self.name = values[DatabaseRef.name] as! String
        self.id = values[DatabaseRef.id] as! String
        self.totalClasses = values[DatabaseRef.totalClasses] as! Int
    }
}
