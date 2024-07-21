//
//  LoginRequest.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

struct LoginRequest: Codable {
    let udacity: LoginInfo
    
    init(username: String, password: String) {
        self.udacity = LoginInfo(username: username, password: password)
    }
}

struct LoginInfo: Codable {
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
