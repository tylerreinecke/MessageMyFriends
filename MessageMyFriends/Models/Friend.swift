//
//  Friend.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import MapKit

class Friend: NSObject, MKAnnotation {
    
    var coordinate : CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    
    var profilePic : UIImage!
    var firstName : String!
    var lastName : String!
    var email : String!
    var coordinates : CLLocationCoordinate2D!

    override init() {
        self.coordinate = coordinates
    }
    
}
