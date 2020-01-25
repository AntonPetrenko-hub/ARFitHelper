//
//  RegisterViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 19.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var logInOrRegLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var haveAnAccountLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerButton.layer.cornerRadius = 14
        
    }

    @IBAction func registerButtonPress(_ sender: Any) {
        
                let name = nameTextField.text!
                let email = emailTextField.text!
                let password = passwordTextField.text!
                
                if(!name.isEmpty && !email.isEmpty && !password.isEmpty) {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error == nil {
                            if let result = result {
                                let ref = Database.database().reference().child("users")
                                
                                ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email, "surname": self.surnameTextField.text!])
                                self.dismiss(animated: true, completion: nil)
                                
                                let startingPage: UIStoryboard = UIStoryboard(name: "StartPage", bundle: nil)
                                let mainViewController = startingPage.instantiateViewController(withIdentifier: "MainPageID") as! MainPageTabBarController
                                self.present(mainViewController, animated: true)
                            }
                        } else {
                            self.showDBorNetworkAlert()
                        }
                    }
                } else {
                    showAlert()
                }
    }
    
    func showDBorNetworkAlert() {
        let alert = UIAlertController(title: "Error", message: "Network or database error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill all fields, please!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainID") as! LoginViewController
        self.present(vc, animated: true)
    }
    
    
}

