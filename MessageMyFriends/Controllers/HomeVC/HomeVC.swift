//
//  HomeVC.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController {
    
    var friendTable : UITableView!
    var friendMap : MKMapView!
    var logoutButton : UIBarButtonItem!
    var addFriendButton : UIBarButtonItem!
    var friendSelected : Friend?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
    }
}
