//
//  StudentData.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 21/7/24.
//

import Foundation

class StudentsData: NSObject {
    
    var students = [StudentInfo]()
    
    class func sharedInstance() -> StudentsData {
        struct Singleton {
            static var sharedInstance = StudentsData()
        }
        return Singleton.sharedInstance
    }
    
}
