//
//  FirebaseAPI.swift
//  MessageMyFriends
//
//  Created by Tyler Reinecke on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import Firebase

class FirebaseAPI {
    
    func putUser(_ modelUser : User, _ image : UIImage) {
        var ref = Database.database().reference()
        let userNode = ref.child("users")
        let userID = Auth.auth().currentUser?.uid
        
        let user = ["uid": userID,
                    "fcm": "zsdfasdf",
                    "firstName": modelUser.firstName,
                    "lastName": modelUser.lastName,
                    "email": modelUser.email,
                    "shareLocation": modelUser.sharingLocation,
                    "coordinate": modelUser.coordinate,
                    "friendsList": modelUser.friendsList,
                    "friendsStatuses": modelUser.friendStatuses] as [String : Any]
        
        userNode.child(userID!).setValue(user)
        
        let storage = Storage.storage().reference()
        if let data = image.jpegData(compressionQuality: 0.4) {
            storage.child("\(modelUser.firstName!)\(modelUser.lastName!).jpeg").putData(data, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    //self.showError(title: "Error:", message: "Could not upload image.")
                    print("ERROR UPLOADING IMAGE")
                    return
                }
                print(metadata)
            })
        }
    }
    
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        //self.present(alert, animated: true, completion: nil)
    }
    
    
}
