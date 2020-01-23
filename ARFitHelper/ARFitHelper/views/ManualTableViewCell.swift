//
//  ManualTableViewCell.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 21.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ManualTableViewCell: UITableViewCell {

    @IBOutlet weak var exerciseNameLabel: UILabel!
    
    @IBOutlet weak var exerciseDescriptionLabel: UILabel!
    
    @IBOutlet weak var targetingMusclesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ exercise: Exercise) {
        exerciseNameLabel.text = exercise.name
        exerciseDescriptionLabel.text = exercise.kind
        targetingMusclesLabel.text = exercise.targetingMuscles
    }
    
}
