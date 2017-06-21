//
//  ViewController.swift
//  Attendance2.0
//
//  Created by Brett Fisher on 6/21/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {
    
    var dummyClassData = ["IST 110", "IST 452", "SRA 200"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("The view has loaded successfully.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Data Source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyClassData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CoursesTableViewCell
        cell.courseNameLabel.text = dummyClassData[indexPath.row]
        return cell
    }
    
    // MARK: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddCourse" {
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! AddCourseViewController!
            controller?.delegate = self
        }
    }

}

extension CoursesViewController: AddCourseViewControllerDelegate {
    func addCourseViewControllerDidCancel(_ controller: AddCourseViewController) {
        dismiss(animated: true, completion: nil)
    }
}
