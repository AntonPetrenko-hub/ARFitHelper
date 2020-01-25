//
//  ManualTableViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 21.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ManualTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var resultSearchController = UISearchController()
    var exercisesNames = [String]()
    var exercisesKind = [String]()
    var exercisesTargetingMuscles = [String]()
    
    @IBOutlet var myTableView: UITableView!
    
    private var exercises: [Exercise] = [Exercise(name: "bench-press", kind: "basic", targetingMuscles: "chest", synergistsMuscles: "triceps", technic: "lie and work hard", videoURL: URL(string: "https://youtu.be/sbB_0N_AfHg")!), Exercise(name: "boom pressure on the inclined bench", kind: "basic", targetingMuscles: "big pectoral, small pectoral", synergistsMuscles: "triceps", technic: "lie and work hard on the inclined bench", videoURL: URL(string: "https://youtu.be/_Wqq1D8FHKI")!), Exercise(name: "lying bench-press with free weights", kind: "basic", targetingMuscles: "big pectoral, small pectoral", synergistsMuscles: "triceps", technic: "lie and work hard on the bench with free weights", videoURL: URL(string: "https://youtu.be/n48eoyd53kk")!)]
    
    var filteredTableData = [Exercise]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in 0..<exercises.count {
            exercisesNames.append(exercises[item].name)
            exercisesKind.append(exercises[item].kind)
            exercisesTargetingMuscles.append(exercises[item].targetingMuscles)
        }
        
        print(exercisesNames)
        
        myTableView.dataSource = self
        myTableView.delegate = self
        let nib = UINib(nibName: "ManualTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ManualCellID")
        
       // MARK: Configure search bar
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar

            return controller
        })()

        // Reload the table
        tableView.reloadData()
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if  (resultSearchController.isActive) {
             return filteredTableData.count
         } else {
             return exercises.count
         }
        
       
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManualCellID", for: indexPath) as! ManualTableViewCell
        
        
        if (resultSearchController.isActive) {
//            cell.textLabel?.text = filteredTableData[indexPath.row]
            cell.configure(filteredTableData[indexPath.row])


            return cell
        }
        else {
            cell.configure(exercises[indexPath.row])

//            cell.textLabel?.text = tableData[indexPath.row]
//            print(tableData[indexPath.row])
            return cell
        }
        
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let page: UIStoryboard = UIStoryboard(name: "DetailedExercise", bundle: Bundle.main)
        let viewController = page.instantiateViewController(withIdentifier: "DetailedManualID") as! DetailedManualViewController
        viewController.exc = exercises[indexPath.row]
        self.present(viewController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func backButtonPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "StartPage", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainPageID")
        self.present(viewController, animated: true)
    }
 
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        let testTableData = exercises
//        let array1 = (exercisesNames as NSArray).filtered(using: searchPredicate)
//        let array2 = (exercisesKind as NSArray).filtered(using: searchPredicate)
//        let array3 = (exercisesTargetingMuscles as NSArray).filtered(using: searchPredicate)
        
        let res = exercises.filter{ searchPredicate.evaluate(with: $0.name) || searchPredicate.evaluate(with: $0.kind) || searchPredicate.evaluate(with: $0.targetingMuscles)}
        
        filteredTableData = res as! [Exercise]

        self.tableView.reloadData()
    }

}

