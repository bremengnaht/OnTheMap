//
//  ErrorResponse.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

struct ErrorResponse: Codable, Error {
    let status: Int?
    let error: String
}
