//
//  StudentLocations.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

struct CreateStudentLocationRequest: Codable {
    let firstName: String
    let lastName: String
    let latitude: Double
    let longitude: Double
    let mapString: String
    let mediaURL: String
    let uniqueKey: String
}
