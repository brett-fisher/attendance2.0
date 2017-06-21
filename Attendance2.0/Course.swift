//
//  Course.swift
//  Attendance2.0
//
//  Created by Panucci, Julian R on 6/21/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import Foundation
import Firebase

class Course {
    
    var id: String = ""
    var name: String
    var location: String
    var totalStudents: Int
    var students: [Student]
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
        self.totalStudents = 0
        self.students = [Student]()
    }
    
    init(snapshot: FIRDataSnapshot) {
        let values = snapshot.value as! NSDictionary
        
        id = snapshot.key
        name = values[DatabaseRef.name] as! String
        location = values[DatabaseRef.location] as! String
        totalStudents = values[DatabaseRef.totalStudents] as! Int
    
        self.students = [Student]()
    }
    
}
