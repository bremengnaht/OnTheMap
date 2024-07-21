//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation
import UIKit

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
                return Endpoints.base + "/StudentLocation?order=-updateAt"
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
        // TODO
    }
    
    // MARK: Auth APIs
    
    static func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> Void) {
        RequestHelper.taskForPOSTOrPutRequest(url: Endpoints.login.url, httpMethod: "POST", requestBody: LoginRequest(username: email, password: password), responseType: LoginResponse.self, completion: completion)
    }
    
    static func logout(completion: @escaping (Bool?, Error?) -> Void) -> Void {
        var request = URLRequest(url: Endpoints.logout.url)
        request.httpMethod = "DELETE"
        var xsrfCookie: HTTPCookie? = nil
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
        }
        if let xsrfCookie = xsrfCookie {
            request.setValue(xsrfCookie.value, forHTTPHeaderField: "X-XSRF-TOKEN")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            let httpURLResponse = response as! HTTPURLResponse
            if httpURLResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil, ErrorResponse(status: nil, error: "Failed to logout"))
                }
            }
        }
        task.resume()
    }
    
    static func signUp() -> Void {
        UIApplication.shared.open(Endpoints.signup.url)
    }
}
