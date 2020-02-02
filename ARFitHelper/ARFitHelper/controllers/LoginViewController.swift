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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lowLabel.text = " "

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lowLabel.text = " "
 
    }
    

    @IBAction func loginButtonPress(_ sender: Any) {
       
        if validLogin(loginTextField.text) && validPassword(passwordTextField.text) {
            
            let login = loginTextField.text!
            let password = passwordTextField.text!
            
            if(!login.isEmpty && !password.isEmpty) {
              Auth.auth().signIn(withEmail: login, password: password) { (result, error) in
                  if error == nil {
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    let startingPage: UIStoryboard = UIStoryboard(name: "StartPage", bundle: nil)
                    let mainViewController = startingPage.instantiateViewController(withIdentifier: "MainPageID") as! MainPageTabBarController
                    self.present(mainViewController, animated: true)
                  }
              }
            } else {
                showAlert()
            }
        } else {
            lowLabel.text = "Wrong login or password!"
        }
    }
    
    
    @IBAction func logOutButtonPress(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        let registerPage = UIStoryboard(name: "Register", bundle: Bundle.main)
        let registerViewController = registerPage.instantiateViewController(identifier: "RegisterViewControllerID") as! RegisterViewController
        self.present(registerViewController, animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill all fields, please!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

