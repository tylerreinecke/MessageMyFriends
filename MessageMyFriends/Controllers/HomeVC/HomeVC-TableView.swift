//
//  HomeVC-TableView.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func height(for index: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.initCellFrom(size: CGSize(width: tableView.frame.width, height: height(for: indexPath)))
        let friend = Constants.friendsList[indexPath.row]
        cell.updateFriend(to: friend)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        friendSelected = Constants.friendsList[indexPath.row]
        self.performSegue(withIdentifier: "toChatVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ChatVC {
            nextVC.friend = friendSelected
        }
    }
    
}
