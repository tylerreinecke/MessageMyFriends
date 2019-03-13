//
//  File.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

/*import Foundation
import ARMDevSuite

class Chat: FirebaseReady, Comparable {
    
    var uid: String!
    var timeSent: Date!
    var senderID: String!
    var msg: String!
    
    init(msg: String, sender: User) {
        self.uid = LogicSuite.uuid()
        self.timeSent = Date()
        self.senderID = sender.uid
        self.msg = msg
    }
    
    static func < (lhs: Message, rhs: Message) -> Bool {
        return lhs.timeSent > rhs.timeSent
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    func createPushable() -> [String : Any?] {
        var ret:[String: Any?] = [:]
        
        ret["time"] = timeSent.description
        ret["sender"] = senderID
        ret["msg"] = msg
        
        return ret
    }
    required init(key: String, record: [String : Any?]) {
        self.uid = key
        self.timeSent = (record["time"] as? String)?.toDateTime()
        self.senderID = record["sender"] as? String ?? ""
        self.msg = record["msg"] as? String
    }
    
}*/

