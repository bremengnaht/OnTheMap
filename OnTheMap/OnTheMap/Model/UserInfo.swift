//
//  UserInfo.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 22/7/24.
//

import Foundation

struct UserInfo: Codable {
    let firstName: String
    let lastName: String
    
    enum CodingKeys:String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
