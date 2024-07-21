//
//  ListViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    var data: [StudentInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        activityIndicator.startAnimating()
        UdacityClient.getStudentLocations(completion: handleGetStudentLocationsResponse(locations:error:))
    }
    
    @IBAction func logout(_ sender: Any) {
        activityIndicator.startAnimating()
        UdacityClient.logout(completion: handleLogout(success:error:))
    }
    
    @IBAction func refresh(_ sender: Any) {
        activityIndicator.startAnimating()
        UdacityClient.getStudentLocations(completion: handleGetStudentLocationsResponse(locations:error:))
    }
    
    //MARK: Table Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnTheMapReuseID", for: indexPath) as! CustomUITableViewCell
        
        let data = data[indexPath.row]
        cell.txtTitle.text = "\(data.firstName) \(data.lastName)"
        cell.txtSubtitle.text = data.mediaURL
        
        return cell
    }
    
    //MARK: Handler
    func handleGetStudentLocationsResponse(locations: StudentLocations?, error: Error?) -> Void {
        activityIndicator.stopAnimating()
        guard let locations = locations?.results else {
            return
        }
        self.data = locations
        tableView.reloadData()
    }
    
    func handleLogout(success: Bool?, error: Error?) -> Void {
        activityIndicator.stopAnimating()
        if let error = error {
            showAlert(title: "Logout Failed", message: (error as! ErrorResponse).error)
        } else {
            self.dismiss(animated: true)
        }
    }
}
