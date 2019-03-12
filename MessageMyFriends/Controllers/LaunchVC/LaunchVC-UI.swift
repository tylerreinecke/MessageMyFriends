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
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
        welcomeLabel.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Message My Friends"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        view.addSubview(welcomeLabel)
    }
}
