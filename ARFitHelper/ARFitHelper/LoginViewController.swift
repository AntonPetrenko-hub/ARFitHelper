//
//  LoginViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 16.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowLabel.text = ""
        
 
    }
    

    @IBAction func loginButtonPress(_ sender: Any) {
        
        if validLogin(loginTextField.text) && validPassword(passwordTextField.text) {
            lowLabel.text = "Everything is fine!"
            
            let startingPage: UIStoryboard = UIStoryboard(name: "StartPage", bundle: nil)
            let mainViewController = startingPage.instantiateViewController(withIdentifier: "MainPageID")
            self.present(mainViewController, animated: true)
            
        } else {
            lowLabel.text = "Wrong login or password!"
        }
    }

}
