//
//  ChosenExercisesTableViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 28.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ChosenExercisesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "ChosenExerciseTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailExerciseID")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chosenExercises.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenExercises.remove(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = tableView.dequeueReusableCell(withIdentifier: "DetailExerciseID", for: indexPath) as! ChosenExerciseTableViewCell
               
        cell.configure(chosenExercises[indexPath.row])
        
        return cell
    }
    
}
