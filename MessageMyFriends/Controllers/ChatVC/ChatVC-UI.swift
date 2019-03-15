//
//  ChatVC-Firebase.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

extension ChatVC: MessagesDisplayDelegate {
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {
        
        let message = messages[indexPath.section]
        let color = message.member.color
        avatarView.backgroundColor = color
    }
}
