//
//  File.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension LoginVC {
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @objc func loginButtonPressed(){
        guard let emailField = emailTextField.text else { return }
        
        guard emailField != "" else {
            userError(2)
            return
        }
        
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://www.example.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(com.mdb.iostraining.sp19.mp5.anity)
        
        if isValidEmail(testStr: emailField) {
            signIn(email: emailField)
        }
    }
    
    func userError(_ errorType : Int) {
        var message = ""
        
        switch errorType {
        case 1:
            message = "Wrong Username and Password Pair. Please recheck your inputs "
        case 2:
            message = "Missing input. Your email is blank!"
        default:
            message = "something went wrong! try again later"
        }
        
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        signupButton.isUserInteractionEnabled = true
    }
    
    func signIn(email: String) {
        Auth.auth().sendSignInLink(toEmail:email, actionCodeSettings: actionCodeSettings) { error in
            if let error = error {
                self.showMessagePrompt(error.localizedDescription)
                return
            }
            // The link was successfully sent. Inform the user.
            // Save the email locally so you don't need to ask the user for it again
            // if they open the link on the same device.
            UserDefaults.standard.set(email, forKey: "Email")
            self.showMessagePrompt("Check your email for link")
            // ...
        }

        
    }
    
    
}
