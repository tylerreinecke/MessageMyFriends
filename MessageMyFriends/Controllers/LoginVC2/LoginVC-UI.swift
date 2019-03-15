//
//  File.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit

extension LoginVC: UITextFieldDelegate {
    func initUI() {
        logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        logoView.center = CGPoint(x: view.frame.midX, y: view.frame.midY-100)
        logoView.image = UIImage(named: "messageFriendsLogo")
        view.addSubview(logoView)
        
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        welcomeLabel.center = CGPoint(x: view.frame.midX, y: logoView.frame.maxY)
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Message My Friends"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 34.0)
        view.addSubview(welcomeLabel)
        
        emailTextField = UITextField(frame: CGRect(x: view.frame.width/3, y: welcomeLabel.frame.maxY + 20, width: view.frame.width / 1.5, height: 40))
        emailTextField.center = CGPoint(x: view.frame.midX, y: welcomeLabel.frame.maxY + 30)
        emailTextField.placeholder = "Email"
        emailTextField.delegate = self
        emailTextField.autocapitalizationType = .none
        emailTextField.textAlignment = .center
        emailTextField.backgroundColor = .lightGray
        emailTextField.layer.cornerRadius = 15
        view.addSubview(emailTextField)
        
        sendEmailButton = UIButton(frame: CGRect(x: view.frame.width/3.5, y: emailTextField.frame.maxY + 50, width: view.frame.width/2, height: 30))
        sendEmailButton.setTitle("Create Account", for: .normal)
        sendEmailButton.center = CGPoint(x: view.frame.midX, y: emailTextField.frame.maxY + 20)
        sendEmailButton.backgroundColor = UIColor(red:0.57, green:0.70, blue:0.95, alpha:1.0)
        sendEmailButton.layer.cornerRadius = 12
        sendEmailButton.setTitleColor(.white, for: .normal)
        sendEmailButton.addTarget(self, action: #selector(sendEmailPressed), for: .touchUpInside)
        view.addSubview(sendEmailButton)
        
        addTapDismiss()

        }
    
    func addTapDismiss() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: emailTextField, action: #selector(resignFirstResponder)))
    }
    
    
    
    /*
    @objc func dismissKeyboard(){
        emailTextField.resignFirstResponder()
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
