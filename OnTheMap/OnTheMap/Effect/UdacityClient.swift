//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

class UdacityClient {
    static var auth: LoginResponse?
    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1"
        
        case getStudentLocations
        case addStudentLocation
        case login
        case logout
        case signup
        
        var stringValue: String {
            switch self {
            case .getStudentLocations:
                return Endpoints.base + "/StudentLocation"
            case .addStudentLocation:
                return Endpoints.base + "/StudentLocation"
            case .login:
                return Endpoints.base + "/session"
            case .logout:
                return Endpoints.base + "/session"
            case .signup:
                return "https://auth.udacity.com/sign-up"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
        
    }
    
    // MARK: Student Location APIs
    
    static func getStudentLocations(completion: @escaping (StudentLocations?, Error?) -> Void) -> Void {
        RequestHelper.taskForGETRequest(url: Endpoints.getStudentLocations.url, responseType: StudentLocations.self, completion: completion)
    }
    
    static func addStudentLocation() -> Void {
        
    }
    
    // MARK: Auth APIs
    
    static func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> Void) {
        RequestHelper.taskForPOSTOrPutRequest(url: Endpoints.login.url, httpMethod: "POST", requestBody: LoginRequest(username: email, password: password), responseType: LoginResponse.self, completion: completion)
    }
    
    static func logout() -> Void {
        
    }
    
    static func signUp() -> Void {
        
    }
}
