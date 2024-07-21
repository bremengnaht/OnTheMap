//
//  LoginResponse.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

struct LoginResponse: Codable {
    let account: LoginResponseAccount
    let session: LoginResponseSession
}

struct LoginResponseAccount: Codable {
    let registered: Bool
    let key: String
}

struct LoginResponseSession: Codable {
    let id: String
    let expiration: Date
}
