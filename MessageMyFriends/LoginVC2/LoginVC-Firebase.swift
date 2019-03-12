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
       
        if isValidEmail(testStr: emailField) {
            signIn(email: emailField)
        }
    }
    
    func userError(_ errorType : Int) {
        var message = ""
        
        switch errorType {
        case 1:
            message = "Couldn't Send Email"
        case 2:
            message = "Missing input. Your email is blank!"
        default:
            message = "something went wrong! try again later"
        }
        signupButton.isUserInteractionEnabled = true
    }
    
    func userSuccess(_ errorType : Int) {
        var message = ""
        
        switch errorType {
        case 1:
            message = "Check your email for the sign in link."
        default:
            message = "Check again"
        }
        
        let alert = UIAlertController(title: "Success!", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        signupButton.isUserInteractionEnabled = true
    }
    
    func signIn(email: String) {
        let actionCodeSettings = ActionCodeSettings()
        actionCodeSettings.url = URL(string: "https://messagemyfriends-9b28f.firebaseapp.com")
        actionCodeSettings.handleCodeInApp = true
        actionCodeSettings.setIOSBundleID(Bundle.main.bundleIdentifier!)
        actionCodeSettings.dynamicLinkDomain = "https://anity.page.link/apple-app-site-association"
        Auth.auth().sendSignInLink(toEmail:email, actionCodeSettings: actionCodeSettings) { error in
            if let error = error {
                self.userError(1)
                return
            }
            UserDefaults.standard.set(email, forKey: "Email")
            self.userSuccess(1)
        }

        
    }
    
    
}
