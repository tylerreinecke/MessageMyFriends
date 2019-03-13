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
    var userPhoto : UIImageView!
    var nameLabel : UILabel!
    var friend : Friend!
    var statusLabel : UILabel!
    var addButton : UIButton!
    var acceptLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        //UI Positioning
        userPhoto = UIImageView(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
        userPhoto.center = CGPoint(x: 35, y: self.size.height / 2)
        userPhoto.layer.cornerRadius = 27.5
        userPhoto.clipsToBounds = true
        contentView.addSubview(userPhoto)
        
        nameLabel = UILabel(frame: CGRect(x: userPhoto.frame.maxX + 10, y: userPhoto.frame.minY + 2.5, width: 150, height: 25))
        nameLabel.textAlignment = .left
        contentView.addSubview(nameLabel)
        
        statusLabel = UILabel(frame: CGRect(x: nameLabel.frame.minX, y: userPhoto.frame.midY, width: 150, height: 25))
        statusLabel.textAlignment = .left
        statusLabel.textColor = UIColor.lightGray
        contentView.addSubview(statusLabel)
        
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        addButton.center = CGPoint(x: self.size.width - 40, y: self.size.height / 2)
        addButton.setImage(UIImage(named: "orangePlus"), for: .normal)
        //only add to contentView if there is a pending friend request
        contentView.addSubview(addButton)
        
        acceptLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 15))
        acceptLabel.center = CGPoint(x: addButton.frame.midX, y: addButton.frame.maxY + 5)
        acceptLabel.textAlignment = .center
        acceptLabel.text = "Accept Request"
        acceptLabel.adjustsFontSizeToFitWidth = true
        contentView.addSubview(acceptLabel)
        //only add to contentView if there is a pending friend request
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateFriend(to newFriend: Friend) {
        //UI Content
        self.friend = newFriend
        
        userPhoto.image = self.friend.profilePic
        nameLabel.text = "\(self.friend.firstName!) \(self.friend.lastName!)"
        if self.friend.sharingLocation {
            statusLabel.text = "Friends"
        } else {
            statusLabel.text = "Hiding"
        }
        
    }

}
