//
//  ChatVC.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import MessageKit
import ChameleonFramework

class ChatVC: MessagesViewController {
    var messages: [Message] = []
    var member: Member!
    var friend: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        member = Member(name: "Anita S", color: UIColor(red:0.76, green:0.62, blue:0.95, alpha:1.0))
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self as? MessagesDisplayDelegate
    }
    
}

