//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    // in case of prod do a pop up or show in a label via first mapping all the codes in a switch
                    print(e.localizedDescription)
                } else {
                    // Login and Navigate to the chat view controller
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
    }
}
