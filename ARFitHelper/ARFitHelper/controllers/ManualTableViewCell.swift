//
//  ManualTableViewCell.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 21.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ManualTableViewCell: UITableViewCell {
    
    var exerciseBuffer: Exercise?
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    @IBOutlet weak var exerciseDescriptionLabel: UILabel!
    
    @IBOutlet weak var targetingMusclesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configure(_ exercise: Exercise) {
        exerciseBuffer = exercise
        exerciseNameLabel.text = exercise.name
        exerciseDescriptionLabel.text = exercise.kind
        targetingMusclesLabel.text = exercise.targetingMuscles
    }
    @IBAction func addButtonPress(_ sender: UIButton) {
        chosenExercises.append(exerciseBuffer!)
        print(chosenExercises)
        let alert = UIAlertController(title: "Exercise list changing", message: "Chosen exercise was added to your training", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
//        present(alert, animated: true, complition: nil)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)

    }
    
}
