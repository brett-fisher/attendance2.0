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

}

