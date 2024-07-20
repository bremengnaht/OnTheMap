//
//  LoginResponse.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

struct LoginResponse: Decodable {
    let account: LoginResponseAccount
    let session: LoginResponseSession
}

struct LoginResponseAccount: Decodable {
    let registered: Bool
    let key: String
}

struct LoginResponseSession: Decodable {
    let id: String
    let expiration: Date
}
