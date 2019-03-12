//
//  FriendCell.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    var size : CGSize!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        //UI Positioning
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateFriend(to newFriend: Friend) {
        //UI Content
        
    }

}
