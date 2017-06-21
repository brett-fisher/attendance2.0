//
//  APIClient.swift
//  
//
//  Created by Panucci, Julian R on 6/21/17.
//
//

import Foundation
import Firebase

class APIClient {
    static let sharedInstance = APIClient()
    var ref: FIRDatabaseReference
    
    init() {
        ref = FIRDatabase.database().reference()
    }
    
    
    
    /// Retrieves a list of all courses in the database
    ///
    /// - Parameter completion: returns an array of Courses
    public func getAllCourses(completion: @escaping ([Course]) -> Void) {
        ref.child(DatabaseRef.courses).observeSingleEvent(of: .value, with: { (snapshot) in
            var courses = [Course]()
            for child in snapshot.children {
                let childSnap = child as! FIRDataSnapshot
                let course = Course(snapshot: childSnap)
                courses.append(course)
            }
            
            completion(courses)
        })
    }
    
    
    //MARK: - Courses
    
    
    /// Adds a new course to Firebase Database
    ///
    /// - Parameter course: Course to add to database
    public func add(course: Course) {
        ref.child(DatabaseRef.courses).childByAutoId().setValue([DatabaseRef.name: course.name, DatabaseRef.location: course.location, DatabaseRef.totalStudents: course.totalStudents])
    }
    
    
    
    /// Adds a student to course roster. If student does not exists in database, he/she is added to list of all students in database
    ///
    /// - Parameters:
    ///   - student: Student to add to course
    ///   - course: Course student is being added to
    public func add(student: Student, toCourse course: Course) {
        var studentToAdd = student
        ref.child(DatabaseRef.students).child(student.id).observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists() {
                studentToAdd = Student(snapshot: snapshot)
            }else {
                //Add to student to student datbase
                self.add(student: studentToAdd)
            }
            
            self.ref.child(DatabaseRef.courses).child(course.id).child(DatabaseRef.students).child(studentToAdd.id).updateChildValues([DatabaseRef.name: studentToAdd.name])
        })
        
    }
    
  
    
    //MARK: - Students
    
    
    /// Adds student to database to list of all students
    ///
    /// - Parameter student: Student adding
    public func add(student: Student) {
        ref.child(DatabaseRef.students).child(student.id).updateChildValues([DatabaseRef.name: student.name, DatabaseRef.id: student.id, DatabaseRef.totalClasses: student.totalClasses])
    }
    
    
    /// Removes a student from a course
    ///
    /// - Parameters:
    ///   - student: Student to remove
    ///   - course: Course to remove student from
    public func remove(student: Student, fromCourse course: Course) {
        ref.child(DatabaseRef.courses).child(course.id).child(DatabaseRef.students).child(student.id).removeValue()
    }
}


struct DatabaseRef {
    static let courses = "courses"
    static let students = "students"
    static let name = "name"
    static let location = "location"
    static let totalStudents = "totalStudents"
    static let id = "id"
    static let totalClasses = "totalClasses"
}
