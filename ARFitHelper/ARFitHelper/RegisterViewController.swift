//
//  RegisterViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 19.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerButton.layer.cornerRadius = 14
        
    }

    @IBAction func registerButtonPress(_ sender: Any) {
    }
    
    
}
