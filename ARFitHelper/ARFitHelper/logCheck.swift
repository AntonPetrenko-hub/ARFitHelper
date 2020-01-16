//
//  logCheck.swift
//  ARFitHelper
//
//  Created by Антон Петренко on 16.01.2020.
//  Copyright © 2020 Антон Петренко. All rights reserved.
//

import Foundation

func validLogin (_ login: String?) -> Bool {
    
    if let loginText = login {
        if loginText.count > 3 {
            return true
        } else {
            return false
        }
    } else {
    return false
    }
}

func validPassword (_ pass: String?) -> Bool {
    
    if let passText = pass {
        if passText.count > 3 {
            return true
        } else {
            return false
        }
    } else {
    return false
    }
}
