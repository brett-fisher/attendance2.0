//
//  AddCourseViewController.swift
//  Attendance2.0
//
//  Created by Brett Fisher on 6/21/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit

protocol AddCourseViewControllerDelegate: class {
    func addCourseViewControllerDidCancel(_ controller: AddCourseViewController)
}

class AddCourseViewController: UIViewController {
    
    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var classLocationTextField: UITextField!
    
    weak var delegate: AddCourseViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: Any) {
        delegate?.addCourseViewControllerDidCancel(self)
    }
    
    @IBAction func save(_ sender: Any) {
        
        if let name = classNameTextField.text, let location  = classLocationTextField.text {
            let course = Course(name: name, location: location)
            APIClient.sharedInstance.add(course: course)
            
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}
