//
//  CurrentExerciseViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 30.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

var excCounter: Int = 0
var attemptCounter: Int = 1

class CurrentExerciseViewController: UIViewController {
    
    let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    @IBOutlet weak var excNameLabel: UILabel!
    
    @IBOutlet weak var excCurAttemptLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // bug with empty array of chosen exercises
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sexypump1.png")!)
        pickerView.dataSource = self
        pickerView.delegate = self
        excNameLabel.text = "Name: " + chosenExercises[excCounter].name
        excCurAttemptLabel.text = "Attempt: " + String(attemptCounter)

    }

    @IBAction func finishButtonDidTap(_ sender: Any) {
        
        if (excCounter + 1) >= chosenExercises.count && attemptCounter >= totalnum{
            // show screen of the ended training
            let alert = UIAlertController(title: "Message", message: "Congrats! You've ended your training!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                let sb = UIStoryboard(name: "StartPage", bundle: Bundle.main)
                let mainViewController = sb.instantiateViewController(withIdentifier: "MainPageID") as! MainPageTabBarController
                self.present(mainViewController, animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
                   if attemptCounter >= totalnum {
                       excCounter += 1
                       attemptCounter = 1
                   } else {
                    attemptCounter += 1
                    }
            let sb = UIStoryboard(name: "CurrentExrcise", bundle: Bundle.main)
            let mainViewController = sb.instantiateViewController(withIdentifier: "CurrExcID") as! CurrentExerciseViewController
            self.present(mainViewController, animated: true)
        }
    }
}

extension CurrentExerciseViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nums[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
    
}
