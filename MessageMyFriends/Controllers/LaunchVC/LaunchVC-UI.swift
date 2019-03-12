//
//  LaunchVC-UI.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension LaunchVC {
    func initUI() {
        logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        logoView.center = CGPoint(x: view.frame.midX, y: 300)
        logoView.image = UIImage(named: "messageFriendsLogo")
        view.addSubview(logoView)
        
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        welcomeLabel.center = CGPoint(x: view.frame.midX, y: logoView.frame.maxY)
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Message My Friends"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 34.0)
        view.addSubview(welcomeLabel)
        
    }
}
