//
//  StartTrainingViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 29.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit 

class StartTrainingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "morepullup.png")!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func beginButtonPress(_ sender: UIButton) {
        let startingPage: UIStoryboard = UIStoryboard(name: "ExerciseSet", bundle: nil)
        let mainViewController = startingPage.instantiateViewController(withIdentifier: "ExerciseSetID") as! ExerciseSetViewController
        self.present(mainViewController, animated: true)
    }
    
    
}
