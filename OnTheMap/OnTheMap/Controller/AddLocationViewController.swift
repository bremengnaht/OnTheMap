//
//  AddLocationViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 21/7/24.
//

import UIKit
import MapKit

class AddLocationViewController: UIViewController {
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtLink: UITextField!
    
    var request: CreateStudentLocationRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func findLocation(_ sender: Any) {
        guard let locationText = txtLocation.text else { return }
        guard let linkText = txtLink.text else { return }
        guard locationText != "" && linkText != "" else {
            showAlert(title: "Alert !", message: "Can't leave empty")
            return
        }
        guard isValidURL(linkText) else {
            showAlert(title: "Alert !", message: "Link is not valid")
            return
        }
        
        CLGeocoder().geocodeAddressString(locationText) { (newMarker, error) in
            if error != nil {
                self.showAlert(title: "Error", message: "Location Not Found")
            } else {
                var location: CLLocation?
                if let marker = newMarker, marker.count > 0 {
                    location = marker.first?.location
                }
                if let location = location {
                    self.request = CreateStudentLocationRequest(firstName: "Test", lastName: "User", latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, mapString: locationText, mediaURL: linkText, uniqueKey: UUID().uuidString)
                    self.performSegue(withIdentifier: "addLocationFinalStep", sender: nil)
                } else {
                    self.showAlert(title: "Alert !", message: "Location do not exists")
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addLocationFinalStep" {
            let destination = segue.destination as! ConfirmLocationViewController
            destination.request = self.request
        }
    }
}
