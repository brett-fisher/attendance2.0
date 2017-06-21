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
    
    weak var delegate: AddCourseViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancel(_ sender: Any) {
        delegate?.addCourseViewControllerDidCancel(self)
    }

}
