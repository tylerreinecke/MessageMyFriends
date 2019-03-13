//
//  Friend.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/11/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit
import MapKit

class User: NSObject, MKAnnotation {
    
    var coordinate : CLLocationCoordinate2D
    var title : String?
    var subtitle : String?
    
    var uid : String!
    var profilePic : UIImage!
    var firstName : String!
    var lastName : String!
    var email : String!
    var sharingLocation : Bool!
    var friendStatuses : [String : String] = [:] //key is userID, value is "hiding" or "sharing"

    override init() {
        self.coordinate = CLLocationCoordinate2D(latitude: 37.8719, longitude: 122.2585)

        self.title = "Title"
        self.subtitle = "subtitle"
        self.profilePic = UIImage(named: "LinkedInProfilePic")
        self.firstName = "Tyler"
        self.lastName = "Reinecke"
        self.email = "tylerreinecke@gmail.com"
        self.sharingLocation = true
    }
    
}
