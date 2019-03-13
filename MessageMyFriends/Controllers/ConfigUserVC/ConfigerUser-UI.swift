//
//  ConfigerUser-UI.swift
//  MessageMyFriends
//
//  Created by Anita Shen on 3/12/19.
//  Copyright © 2019 Tyler Reinecke. All rights reserved.
//

import UIKit

extension ConfigUserVC {

    /// Add signup screen elements
    func uiSetup(){
        profileImageSetup()
        userNameSetup()
        emailDisplay()
        
    }
    
    func profileImageSetup(){
        profileImage = UIButton(frame: CGRect(x: 0, y: view.frame.height / 10, width: view.frame.width, height: view.frame.height / 3))
        profileImage.setImage(UIImage(named: "profile"), for: .normal)
        profileImage.contentMode = .scaleAspectFit
        profileImage.imageView?.contentMode = .scaleAspectFill
        profileImage.addTarget(self, action: #selector(imageTaking), for: .touchUpInside)
        //view.insertSubview(eventImageButton, at: 0)
        view.addSubview(profileImage)
    }
    
    @objc func imageTaking() {
        let actionSheet = UIAlertController(title: "Select Photo From", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            self.createImagePicker(preferredType: .camera)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action) -> Void in
            self.createImagePicker(preferredType: .photoLibrary)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true)
    }
    
    @objc func createImagePicker(preferredType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            picker.sourceType = preferredType
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(picker, animated: true, completion: nil)
        }
        else {
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController,
                                     didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.setImage(chosenImage, for: .normal)
        dismiss(animated:true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func userNameSetup(){
        firstName = UITextField(frame: CGRect(x: view.frame.width / 12 , y: profileImage.frame.maxY + 50, width: view.frame.width - 80, height: 50))
        firstName.text = "First Name"
        firstName.font = UIFont(name: "Avenir", size: 28)
        firstName.layer.cornerRadius = 7
        firstName.textColor = UIColor(red:0.57, green:0.70, blue:0.95, alpha:1.0)
        view.addSubview(firstName)
        
        lastName = UITextField(frame: CGRect(x: view.frame.width / 12 , y: firstName.frame.maxY + 50, width: view.frame.width - 80, height: 50))
        lastName.text = "Last Name"
        lastName.font = UIFont(name: "Avenir", size: 28)
        lastName.layer.cornerRadius = 7
        lastName.textColor = UIColor(red:0.57, green:0.70, blue:0.95, alpha:1.0)
        view.addSubview(lastName)
    }
    
    func emailDisplay(){
        email = UILabel(frame: CGRect(x: view.frame.width / 12 , y: lastName.frame.maxY + 50, width: view.frame.width - 80, height: 50))
        email.textAlignment = .center
        email.text = "Email: "
        email.font = UIFont(name: "Avenir", size: 28)
        view.addSubview(email)
    }
    
    
    
    
    
}
