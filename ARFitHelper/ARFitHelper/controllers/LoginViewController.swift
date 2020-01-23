//
//  LoginViewController.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 16.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowLabel.text = ""
        loginTextField.delegate = self
        passwordTextField.delegate = self
 
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
    
    
    @IBAction func logOutButtonPress(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill all fields, please!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              let login = loginTextField.text!
          let password = passwordTextField.text!
          
          if(!login.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: login, password: password) { (result, error) in
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                }
            }
          } else {
              showAlert()
          }
          return true
    }
}
