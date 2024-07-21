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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func findLocation(_ sender: Any) {
        if (txtLocation.text ?? "") == "" || (txtLink.text ?? "") == "" {
            showAlert(title: "Alert !", message: "Can't leave empty")
        } else {
            
            performSegue(withIdentifier: "addLocationFinalStep", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addLocationFinalStep" {
            let destination = segue.destination as! ConfirmLocationViewController
            destination.location = txtLocation.text!
            destination.link = txtLink.text!
        }
    }
}
