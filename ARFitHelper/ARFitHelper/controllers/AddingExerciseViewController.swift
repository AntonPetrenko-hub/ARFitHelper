//
//  AddingExerciseViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 29.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class AddingExerciseViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var kindTextField: UITextField!
    
    @IBOutlet weak var targetingMusclesTextField: UITextField!
    
    @IBOutlet weak var synergistMusclesTextField: UITextField!
    
    @IBOutlet weak var technicTextField: UITextField!
    
    @IBOutlet weak var videoURLTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "girl.png")!)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonPress(_ sender: UIButton) {
        if fillingCheckForTextField(nameTextField.text ?? "") && fillingCheckForTextField(kindTextField.text ?? "") && fillingCheckForTextField(targetingMusclesTextField.text ?? "") && fillingCheckForTextField(synergistMusclesTextField.text ?? "") && fillingCheckForTextField(technicTextField.text ?? "") && fillingCheckForTextField(videoURLTextField.text ?? ""){
            exercises.append(Exercise(name: nameTextField.text!, kind: kindTextField.text!, targetingMuscles: targetingMusclesTextField.text!, synergistsMuscles: synergistMusclesTextField.text!, technic: technicTextField.text!, videoURL: videoURLTextField.text!))
            let alert = UIAlertController(title: "Adding exercise", message: "New exercise was added! Thank you!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func fillingCheckForTextField(_ text: String) -> Bool {
        if text.count > 5 {
            return true
        } else {
            return false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
