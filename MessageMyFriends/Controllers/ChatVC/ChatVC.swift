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
    var user: User!
    var messages = [Message]()
    var friend: User!
    
    var navbar: UINavigationBar!
    var composeBar: UIView!
    
    let composeBarHeight:CGFloat = 70
    
    var composeTextField: UITextField!
    var sendButton: UIButton!
    
    var chatView: UITableView!
    
    
    var navbarBottom: CGFloat!
    var textfieldOffset: CGFloat!
    
    var initialTableviewFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initUI()
        
        FirebaseAPI.listenForChats { (msg) in
            if !self.messages.contains(msg) {
                self.messages.append(msg)
            }
            if msg.senderID != self.user.uid && self.chatView.numberOfRows(inSection: 0) != self.messages.count {
                self.addMessage()
            }
        }
    }
    
}
