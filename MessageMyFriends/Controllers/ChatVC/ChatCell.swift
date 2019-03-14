//
//  ChatCell.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/14/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import ChameleonFramework

class ChatCell: UITableViewCell {
    
    var msgBackground: UIView!
    var msgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func initializeCellFrom(msg: Message, outbound: Bool, size: CGSize) {
        if outbound {
            msgBackground = UIView(frame: CGRect(x: size.width * 0.25, y: 50, width: size.width * 0.75, height: size.height - 10))
            msgBackground.backgroundColor = .flatSkyBlue
            msgBackground.layer.cornerRadius = 10
            msgBackground.clipsToBounds = true
            
            
            contentView.addSubview(msgBackground)
            
            msgLabel = UILabel(frame: msgBackground.frame)
            msgLabel.frame = CGRect(x: msgBackground.frame.minX + 10, y: msgBackground.frame.minY, width: msgBackground.frame.width - 2, height: msgBackground.frame.height)
            
            msgLabel.text = msg.msg
            msgLabel.textColor = .white
            
            msgLabel.lineBreakMode = .byWordWrapping
            msgLabel.numberOfLines = 0
            msgLabel.textAlignment = .left
            msgLabel.sizeToFit()
            msgLabel.frame.origin = CGPoint(x: msgBackground.frame.maxX - 50, y: msgBackground.frame.midY - msgLabel.frame.height/2)
            
            contentView.addSubview(msgLabel)
            msgBackground.frame = CGRect(x: msgLabel.frame.minX - 10, y: msgBackground.frame.minY, width: msgLabel.frame.width + 20, height: msgBackground.frame.height)
            
            
        } else {
            msgBackground = UIView(frame: CGRect(x: 0, y: 50, width: size.width * 0.75, height: size.height - 10))
            msgBackground.backgroundColor = .flatWhite
            msgBackground.layer.cornerRadius = 10
            msgBackground.clipsToBounds = true
            
            
            contentView.addSubview(msgBackground)
            
            msgLabel = UILabel(frame: msgBackground.frame)
            msgLabel.frame = CGRect(x: msgBackground.frame.minX + 10, y: msgBackground.frame.minY, width: msgBackground.frame.width - 20, height: msgBackground.frame.height)
            
            msgLabel.text = msg.msg
            msgLabel.textColor = .black
            
            msgLabel.lineBreakMode = .byWordWrapping
            msgLabel.numberOfLines = 0
            msgLabel.textAlignment = .left
            msgLabel.sizeToFit()
            msgLabel.frame.origin = CGPoint(x: msgBackground.frame.minX + 20, y: msgBackground.frame.midY - msgLabel.frame.height/2)
            
            contentView.addSubview(msgLabel)
            msgBackground.frame = CGRect(x: 0, y: msgBackground.frame.minY, width: msgLabel.frame.width + 20, height: msgBackground.frame.height)
            
        }
    }
    
    
    
}
