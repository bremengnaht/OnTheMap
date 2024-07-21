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
    
    var location: String = ""
    var link: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishAdd(_ sender: Any) {
        
    }
}
