//
//  AddStudentViewController.swift
//  Attendance2.0
//
//  Created by Brett Fisher on 6/22/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var nineDigitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
