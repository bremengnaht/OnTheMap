//
//  RequestHelper.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation

class RequestHelper {
    
    static func taskForGETRequest<ResponseType: Decodable>(url: URL, formatRes: Bool = true, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, ErrorResponse(status: nil, error: "API return an error"))
                }
                return
            }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            // Must do if call from Udacity's API
            var range = 5..<data.count
            if !formatRes {
                range = 0..<data.count
            }
            let formattedData = data.subdata(in: range)
            
//            print(String(data: data, encoding: .utf8)!)
//            print(String(data: formattedData, encoding: .utf8)!)
            
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: formattedData)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, ErrorResponse(status: nil, error: "Something wrong"))
                }
            }
        }
        task.resume()
    }
    
    static func taskForPOSTOrPutRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, httpMethod: String, formatRes: Bool = true, requestBody: RequestType, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try! encoder.encode(requestBody)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, ErrorResponse(status: nil, error: "API return an error"))
                }
                return
            }
            // Must do if call from Udacity's API
            var range = 5..<data.count
            if !formatRes {
                range = 0..<data.count
            }
            let formattedData = data.subdata(in: range)
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
//            print(String(data: data, encoding: .utf8)!)
//            print(String(data: formattedData, encoding: .utf8)!)
            
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: formattedData)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(ErrorResponse.self, from: formattedData)
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, ErrorResponse(status: nil, error: "Something wrong"))
                    }
                }
            }
        }
        task.resume()
    }
}
