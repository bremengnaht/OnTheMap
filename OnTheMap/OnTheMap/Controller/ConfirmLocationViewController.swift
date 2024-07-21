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
        guard let request = self.request else { return }
        
        let annotation = MKPointAnnotation()
        annotation.title = "\(request.firstName) \(request.lastName)"
        annotation.subtitle = request.mediaURL
        annotation.coordinate = CLLocationCoordinate2D(latitude: request.latitude, longitude: request.longitude)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func finishAdd(_ sender: Any) {
        if let request = request {
            UdacityClient.addStudentLocation(requestBody: request) { response, error in
                if let error = error {
                    self.showAlert(title: "Add Failed", message: (error as! ErrorResponse).error)
                } else {
                    self.dismiss(animated: true)
                }
            }
        }
    }
}
