//
//  ChatVC-Firebase.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
extension ChatVC {
    @objc func sendTextMessage() {
        //        if needsRefresh() {
        //            self.chatView.reloadData()
        //        }
        composeTextField.becomeFirstResponder()
        self.sendButton.isEnabled = false
        guard let msg = composeTextField.text else { return }
        self.composeTextField.text = ""
        
        if msg == "" {
            return
        }
       
        /*
        let textMessage = Message(msg: msg, sender: self.user)
        messages.append(textMessage)
        
        FirebaseAPI.send(msg: textMessage) {
            debugPrint("messageSent")
        }*/
        
        
        addMessage()
        
        
    }
    
    func addMessage() {
       /*
        var newRows = Array(0..<messages.count-self.chatView.numberOfRows(inSection: 0)).map { (index) -> IndexPath in
            return IndexPath(row: index, section: 0)
        }
        
        self.chatView.beginUpdates()
        self.chatView.insertRows(at: newRows, with: .fade)
        self.chatView.endUpdates()*/
    }
}
