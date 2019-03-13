//
//  ConfigUserVC.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class ConfigUserVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var firstName : UITextField!
    var lastName : UITextField!
    
    var email : UILabel!
    var profileImage : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
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
