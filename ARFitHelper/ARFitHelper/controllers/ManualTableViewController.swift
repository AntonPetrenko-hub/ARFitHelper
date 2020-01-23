//
//  ManualTableViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 21.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ManualTableViewController: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    var exc1 = Exercise(name: "bench-press", kind: "basic", targetingMuscles: "chest", synergistsMuscles: "triceps", technic: "lie and work hard", videoURL: URL(string: "https://youtu.be/sbB_0N_AfHg")!)
       
       var exc2 = Exercise(name: "lying bench-press with free weights", kind: "basic", targetingMuscles: "big pectoral, small pectoral", synergistsMuscles: "triceps", technic: "lie and work hard on the bench with free weights", videoURL: URL(string: "https://youtu.be/n48eoyd53kk")!)
    
    private var exercises: [Exercise] = [Exercise(name: "bench-press", kind: "basic", targetingMuscles: "chest", synergistsMuscles: "triceps", technic: "lie and work hard", videoURL: URL(string: "https://youtu.be/sbB_0N_AfHg")!), Exercise(name: "boom pressure on the inclined bench", kind: "basic", targetingMuscles: "big pectoral, small pectoral", synergistsMuscles: "triceps", technic: "lie and work hard on the inclined bench", videoURL: URL(string: "https://youtu.be/_Wqq1D8FHKI")!), Exercise(name: "lying bench-press with free weights", kind: "basic", targetingMuscles: "big pectoral, small pectoral", synergistsMuscles: "triceps", technic: "lie and work hard on the bench with free weights", videoURL: URL(string: "https://youtu.be/n48eoyd53kk")!)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        let nib = UINib(nibName: "ManualTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ManualCellID")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManualCellID", for: indexPath) as! ManualTableViewCell
        
        cell.configure(exercises[indexPath.row])

        return cell
    }

}

