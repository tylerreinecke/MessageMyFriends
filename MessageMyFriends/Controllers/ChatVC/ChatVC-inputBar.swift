//
//  ChatVC-inputBar.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import MessageKit
import MessageInputBar

extension ChatVC: MessageInputBarDelegate {
    func messageInputBar(
        _ inputBar: MessageInputBar,
        didPressSendButtonWith text: String) {
        
        let newMessage = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        
        messages.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}
