//
//  ManualTableViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 21.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import Firebase

class ManualTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var databaseReference: DatabaseReference?
    var databaseHandle: DatabaseHandle?

    var newExc: Exercise?
        
    var resultSearchController = UISearchController()
    
    @IBOutlet var myTableView: UITableView!
    
//    var exercises = [Exercise]()
    var selectedExercises = [Exercise]()
    
    var filteredTableData = [Exercise]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if oneTime == true {
            getDataFromDatabase()
            oneTime = false
        }
        myTableView.accessibilityIdentifier = "ManualTable"
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

        tableView.reloadData()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func getDataFromDatabase() {
              
                databaseReference = Database.database().reference()
                
               databaseHandle = databaseReference?.child("exercises").observe(.childAdded, with: { (snapshot) in
                
                let exerciseFromDB = snapshot.value
             
                if let dict = exerciseFromDB as? [AnyHashable: Any]{
                    let exc = Exercise(name: dict["exercisename"] as? String ?? ""
        , kind: dict["kind"] as? String ?? "", targetingMuscles: dict["targetingMusclesGroup"] as? String ?? "", synergistsMuscles: dict["synergistsMusclesGroup"] as? String ?? "", technic: dict["technic"] as? String ?? "", videoURL: dict["videoURL"] as? String ?? "")
                    
                    exercises.append(exc)
                }
                self.myTableView.reloadData()
                })
            }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if  (resultSearchController.isActive) {
             return filteredTableData.count
         } else {
             return exercises.count
         }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManualCellID", for: indexPath) as! ManualTableViewCell
        cell.accessibilityIdentifier = "manualCell_\(indexPath.row)"

//        cell.backgroundColor = #colorLiteral(red: 0.8727599978, green: 0.8838961124, blue: 0.8835354447, alpha: 1)
//        cell.backgroundView = UIImageView(image: UIImage(named: "lines.png")!)
//        cell.backgroundView?.contentMode = .
        
        if (resultSearchController.isActive) {
            
            cell.configure(filteredTableData[indexPath.row])
            return cell
        }
        else {
            cell.configure(exercises[indexPath.row])

            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resultSearchController.isActive = false
        let page: UIStoryboard = UIStoryboard(name: "DetailedExercise", bundle: Bundle.main)
        let viewController = page.instantiateViewController(withIdentifier: "DetailedManualID") as! DetailedManualViewController
        viewController.exc = exercises[indexPath.row]
//        self.present(viewController, animated: true)
        resultSearchController.isEditing = false
        self.navigationController?.pushViewController(viewController, animated: true)
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
        
        let res = exercises.filter{ searchPredicate.evaluate(with: $0.name) || searchPredicate.evaluate(with: $0.kind) || searchPredicate.evaluate(with: $0.targetingMuscles)}
        
        filteredTableData = res 

        self.tableView.reloadData()
    }
    
  

}

