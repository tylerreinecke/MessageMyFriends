//
//  HomeVC-UI.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import MapKit

extension HomeVC {

    func initUI() {
        setupNavBar()
        setupMapView()
        setupTableView()
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
        friendMap.addAnnotations(Constants.friendsList)
        view.addSubview(friendMap)
    }
    
    func setupTableView() {
        friendTable = UITableView(frame: CGRect(x: 0, y: friendMap.frame.maxY, width: view.frame.width, height: view.frame.height - friendMap.frame.height))
        friendTable.register(FriendCell.self,forCellReuseIdentifier: "friendCell")
        friendTable.delegate = self
        friendTable.dataSource = self
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        friendTable.addGestureRecognizer(longPress)
        view.addSubview(friendTable)
    }
    
    @objc func addFriends() {
        
    }
    
    @objc func logOut() {
        
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: friendTable)
            if let indexPath = friendTable.indexPathForRow(at: touchPoint) {
                // your code here, get the row for the indexPath or do whatever you want
                
            }
        }
    }
}
