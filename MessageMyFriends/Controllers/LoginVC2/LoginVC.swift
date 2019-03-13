//
//  LoginVC.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    var welcomeLabel : UILabel!
    var logoView : UIImageView!
    var emailTextField: UITextField!
    
    var sendEmailButton: UIButton!
    var signInButton: UIButton!
    
    
    var link: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.text = UserDefaults.standard.value(forKey: "Email") as? String
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
