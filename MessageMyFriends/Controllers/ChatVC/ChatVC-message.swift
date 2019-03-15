//
//  File.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

extension ChatVC: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        
        return 0
    }
}
