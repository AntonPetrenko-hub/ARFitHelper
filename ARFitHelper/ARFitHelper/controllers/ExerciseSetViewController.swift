//
//  ExerciseSetViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 29.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

   var totalnum: Int = 0

import UIKit

class ExerciseSetViewController: UIViewController {
    
 
    
    var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "sportgirl2.png")!)
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonTap(_ sender: Any) {
        let startingPage: UIStoryboard = UIStoryboard(name: "CurrentExrcise", bundle: Bundle.main)
        let mainViewController = startingPage.instantiateViewController(withIdentifier: "CurrExcID") as! CurrentExerciseViewController
        self.present(mainViewController, animated: true)
    }
    
}

extension ExerciseSetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        totalnum = nums[row]
        print(totalnum)
    }
}
