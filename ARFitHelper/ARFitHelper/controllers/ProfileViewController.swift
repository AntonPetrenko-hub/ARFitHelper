//
//  ProfileViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 30.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "logout1.png")!)
        userImageView.layer.cornerRadius = 8.0
        userImageView.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonPress(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        let startingPage: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = startingPage.instantiateViewController(withIdentifier: "MainID") as! LoginViewController
        self.present(mainViewController, animated: true)
    }
    

}
