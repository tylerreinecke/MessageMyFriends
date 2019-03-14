//
//  ChatVC-UI.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit


extension ChatVC {
    
    func inputChats() {
        composeBar = UIView(frame: CGRect(x: 0, y: view.frame.maxY - 70, width: view.frame.width, height: 70))
        composeBar.backgroundColor = .white
        
        let sendButtonWidth: CGFloat = 70
        sendButton = UIButton(frame: CGRect(x: view.frame.width - 50, y: 0, width: sendButtonWidth, height: composeBar.frame.height))
        sendButton.setTitle("Send", for: .normal)
        
        sendButton.setTitleColor(.gray, for: .disabled)
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.isEnabled = false
        sendButton.addTarget(self, action: #selector(sendTextMessage), for: .touchUpInside)
    }
   
}
