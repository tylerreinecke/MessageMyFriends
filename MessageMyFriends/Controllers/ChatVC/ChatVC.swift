//
//  ChatVC.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import ARMDevSuite

class ChatVC: UIViewController {
    var composeBar: UIView!
    var composeTextField: UITextField!
    var sendButton: UIButton!
    
    var chatView: UITableView!
    
    
    
    var friend : Friend!

    override func viewDidLoad() {
        super.viewDidLoad()

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
