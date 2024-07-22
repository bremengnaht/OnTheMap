//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        activityIndicator.stopAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activityIndicator.startAnimating()
        UdacityClient.getStudentLocations(completion: handleGetStudentLocationsResponse(locations:error:))
    }

    //MARK: IBAction
    @IBAction func logout(_ sender: Any) {
        activityIndicator.startAnimating()
        UdacityClient.logout(completion: handleLogout(success:error:))
    }
    
    @IBAction func refreshMap(_ sender: Any) {
        activityIndicator.startAnimating()
        UdacityClient.getStudentLocations(completion: handleGetStudentLocationsResponse(locations:error:))
    }
    
    //MARK: Delegate
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let urlString = view.annotation?.subtitle ?? "" else { return }
        guard isValidURL(urlString) else {
            showAlert(title: "Alert !", message: "Link is not valid")
            return
        }
        UIApplication.shared.open(URL(string: urlString)!)
    }
    
    //MARK: Handler
    func handleGetStudentLocationsResponse(locations: StudentLocations?, error: Error?) -> Void {
        activityIndicator.stopAnimating()
        guard let locations = locations?.results else {
            return
        }
        StudentsData.sharedInstance().students = locations
        updateAnnotationFromDataSource()
    }
    
    func handleLogout(success: Bool?, error: Error?) -> Void {
        activityIndicator.stopAnimating()
        if let error = error {
            showAlert(title: "Logout Failed", message: (error as! ErrorResponse).error)
        } else {
            self.dismiss(animated: true)
        }
    }
    
    func updateAnnotationFromDataSource() -> Void {
        var annotations: [MKPointAnnotation] = []
        StudentsData.sharedInstance().students.forEach { location in
            let annotation = MKPointAnnotation()
            annotation.title = "\(location.firstName) \(location.lastName)"
            annotation.subtitle = location.mediaURL
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
}
