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
    
//    var signUp: Bool = true
//    {
//        willSet{
//            if newValue {
//                logInOrRegLabel.text = "Registration"
//                nameTextField.isHidden = false
//                registerButton.setTitle("Enter", for: .normal)
//
//
//            } else {
//                logInOrRegLabel.text = "Enter"
//                nameTextField.isHidden = true
//                registerButton.setTitle("Register", for: .normal)
//            }
//        }
//    }
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
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    @IBAction func registerButtonPress(_ sender: Any) {
//        signUp = !signUp
        let page: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = page.instantiateViewController(withIdentifier: "MainID") as! ViewController
        self.present(viewController, animated: true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill all fields, please!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if(!name.isEmpty && !email.isEmpty && !password.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    if let result = result {
//                        print(result.user.uid)
                        let ref = Database.database().reference().child("users")
                        ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        } else {
            showAlert()
        }
        return true
    }
}
