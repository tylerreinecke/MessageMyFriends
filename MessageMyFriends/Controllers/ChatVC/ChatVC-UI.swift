//
//  ChatVC-Firebase.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/13/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import Foundation
import UIKit
import ARMDevSuite

extension ChatVC {
    func initUI() {
        initNav()
        
        navbarBottom = self.navigationController?.navigationBar.frame.height
        textfieldOffset = (composeBarHeight)
        
        initInputControl()
        initTableview()
        keyboardRehandling()
    }
    
    // UI Initialization Helpers
    func initNav() {
        self.title = "Chat Room"
    }
    
    func initInputControl() {
        
        composeBar = UIView(frame: CGRect(x: 0, y: view.frame.maxY - textfieldOffset, width: view.frame.width, height: composeBarHeight))
        composeBar.backgroundColor = .white

        let itemHeight: CGFloat = composeBarHeight - 2 * 10
        
        let sendButtonWidth: CGFloat = 70
        sendButton = UIButton(frame: CGRect(x: view.frame.width - 70, y: 0, width: sendButtonWidth, height: composeBar.frame.height))
        sendButton.setTitle("Send", for: .normal)
        
        sendButton.setTitleColor(.flatGrayDark, for: .disabled)
        sendButton.setTitleColor(UIColor.flatSkyBlue, for: .normal)
        sendButton.isEnabled = false
        sendButton.addTarget(self, action: #selector(sendTextMessage), for: .touchUpInside)
        
        composeTextField = UITextField(frame: CGRect(x: 100, y: 80, width: (sendButton.frame.minX - 3 * 50), height: itemHeight))
        
        //        composeTextField.attributedPlaceholder = NSAttributedString(string: "Aa", attributes: [NSAttributedString.Key.foregroundColor : UIColor.placeholder, NSAttributedString.Key.font: UIFont.text!])
        composeTextField.placeholder = "Aa"
        composeTextField.textColor = .black
        composeTextField.tintColor = .flatSkyBlueDark
        composeTextField.backgroundColor = .flatWhite
        composeTextField.layer.cornerRadius = composeTextField.frame.height/2
        composeTextField.delegate = self
        composeTextField.returnKeyType = .send
        composeTextField.addTarget(self, action: #selector(messageBoxTyped), for: .allEditingEvents)
        
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        composeTextField.leftViewMode = .always
        composeTextField.leftView = spacerView
        
        let topBorder = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
        topBorder.backgroundColor = .flatWhiteDark
        composeBar.addSubview(topBorder)
        
        composeBar.addSubview(composeTextField)
        composeBar.addSubview(sendButton)
        view.addSubview(composeBar)
    }
    
    func initTableview() {
        chatView = UITableView(frame: LayoutManager.between(elementAbove: self.navigationController!.navigationBar, elementBelow: self.composeBar, width: view.frame.width, topPadding: 0, bottomPadding: 10))
        self.initialTableviewFrame = chatView.frame
        chatView.separatorStyle = .none
        chatView.keyboardDismissMode = .interactive
        chatView.register(ChatCell.self, forCellReuseIdentifier: "chatCell")
        chatView.dataSource = self
        chatView.delegate = self
        chatView.indicatorStyle = .black
        
        chatView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        
        view.addSubview(chatView)
        view.sendSubviewToBack(chatView)
    }
    
    @objc func sendTextMessage() {
        //        if needsRefresh() {
        //            self.chatView.reloadData()
        //        }
        composeTextField.becomeFirstResponder()
        self.sendButton.isEnabled = false
        guard let msg = composeTextField.text else { return }
        self.composeTextField.text = ""
        
        if msg == "" {
            return
        }
        
        let textMessage = Message(msg: msg, sender: self.user)
        messages.append(textMessage)
        
        FirebaseAPI.send(msg: textMessage) {
            debugPrint("messageSent")
        }
        
        
        addMessage()
        
        
    }
    
    func addMessage() {
        
        var newRows = Array(0..<messages.count-self.chatView.numberOfRows(inSection: 0)).map { (index) -> IndexPath in
            return IndexPath(row: index, section: 0)
        }
        
        self.chatView.beginUpdates()
        self.chatView.insertRows(at: newRows, with: .fade)
        self.chatView.endUpdates()
    }
    
    func keyboardRehandling() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
   
}
