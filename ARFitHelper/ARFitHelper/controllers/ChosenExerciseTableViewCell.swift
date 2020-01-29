//
//  ChosenExerciseTableViewCell.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 28.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ChosenExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var musclesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ exercise: Exercise) {
          nameLabel.text = exercise.name
          descriptionLabel.text = exercise.kind
          musclesLabel.text = exercise.targetingMuscles
      }
}
