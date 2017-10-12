//
//  user.swift
//  DVPIVAnimationApp
//
//  Created by Adam Kleisner on 11/2/16.
//  Copyright © 2016 Adam Kleisner. All rights reserved.
//

import UIKit

class user {
    
    var mUserName: String
    var mPassword: String
    var mUserEmail: String
    
    init (userName : String, password: String, email: String) {
        mUserName = userName
        mPassword = password
        mUserEmail = email
    }
    
    init () {
        mUserName = ""
        mPassword = ""
        mUserEmail = ""
    }
    
    func getUserName() -> String {
        return mUserName
    }
    
    func getPassword() -> String {
        return mPassword
    }
    
    func getUserEmail() -> String {
        return mUserEmail
    }
    
    func setUserName(_ newUsername: String) {
        mUserName = newUsername
    }
    
    func setPassword(_ newPassword: String) {
        mPassword = newPassword
    }
    
    func setUserEmail(_ newUserEmail: String) {
        mUserEmail = newUserEmail
    }
    
}
