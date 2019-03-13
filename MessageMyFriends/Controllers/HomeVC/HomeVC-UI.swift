//
//  HomeVC-UI.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import MapKit

extension HomeVC: UIActionSheetDelegate {

    func initUI() {
        makeSampleFriend()
        setupNavBar()
        setupMapView()
        setupTableView()
    }
    
    func makeSampleFriend() {
        Constants.friendsList.append(Friend())
    }
    
    func setupNavBar() {
        self.title = "Friends"
        //self.navigationController?.navigationBar.tintColor = Constants.jade
        self.navigationController?.isNavigationBarHidden = false
        addFriendButton = UIBarButtonItem(title: "Add Friend", style: .plain, target: self, action: #selector(addFriends))
        self.navigationItem.leftBarButtonItem = addFriendButton
        
        logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOut))
        self.navigationItem.rightBarButtonItem = logoutButton
    }
    
    func setupMapView() {
        friendMap = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        friendMap.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        friendMap.delegate = self
        //friendMap.setCenter(CLLocationCoordinate2D(latitude: airport.latitude, longitude: airport.longitude), animated: true) //currently set to users current location, CHANGE THIS
        friendMap.isZoomEnabled = true
        friendMap.isRotateEnabled = true
        friendMap.isScrollEnabled = true
        friendMap.addAnnotation(Constants.friendsList[0])
        view.addSubview(friendMap)
    }
    
    func setupTableView() {
        friendTable = UITableView(frame: CGRect(x: 0, y: friendMap.frame.maxY, width: view.frame.width, height: view.frame.height - friendMap.frame.height))
        friendTable.register(FriendCell.self,forCellReuseIdentifier: "friendCell")
        friendTable.delegate = self
        friendTable.dataSource = self
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        friendTable.addGestureRecognizer(longPress)
        longPress.minimumPressDuration = 0.5
        view.addSubview(friendTable)
    }
    
    @objc func addFriends() {
        self.performSegue(withIdentifier: "toAddFriendsVC", sender: self)
    }
    
    @objc func logOut() {
        
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: friendTable)
            if let indexPath = friendTable.indexPathForRow(at: touchPoint) {
                // your code here, get the row for the indexPath or do whatever you want
                let friendHeld = Constants.friendsList[indexPath.row]
                let currentlySharing = false///friendHeld.friendStatuses[self.user.uid] != "hiding"
                let actionSheet = UIAlertController(title: "\(friendHeld.firstName!) \(friendHeld.lastName!)", message: "Choose Option", preferredStyle: .actionSheet)
                let showAction = UIAlertAction(title: "Show on map", style: .default, handler: {(action) in self.showOnMap(friendHeld)})
                let locationAction = UIAlertAction(title: currentlySharing ? "Stop Sharing Location" : "Resume Location Sharing", style: .default, handler: {(action) in self.updateLocationSharing(friendHeld)})
                let removeAction = UIAlertAction(title: "Remove friend", style: .default, handler: {(action) in self.removeFriend(friendHeld)})
                actionSheet.addAction(showAction)
                actionSheet.addAction(locationAction)
                actionSheet.addAction(removeAction)
                actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(actionSheet, animated: true)
            }
        }
    }
    
    func showOnMap(_ friend: Friend) {
        
    }
    
    func updateLocationSharing(_ friend: Friend) {
        
    }
    
    func removeFriend(_ friend: Friend) {
        
    }
    
    
}
