//
//  ConfirmLocationViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 21/7/24.
//

import UIKit
import MapKit

class ConfirmLocationViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    var request: CreateStudentLocationRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishAdd(_ sender: Any) {
        if let request = request {
            UdacityClient.addStudentLocation(requestBody: request) { response, error in
                print("TEST")
                self.dismiss(animated: true)
            }
        }
    }
}
