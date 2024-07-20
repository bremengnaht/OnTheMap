//
//  LogInViewController.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtEmail.text = ""
        txtPassword.text = ""
    }
    
    @IBAction func login(_ sender: UIButton) {
        enableLogInControls(false)
        
        //success
        self.performSegue(withIdentifier: "loginSuccessSegue", sender: nil)
    }
    
    private func enableLogInControls(_ enabled: Bool) -> Void {
        if enabled {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
        isEnableControl(enabled, control: txtEmail)
        isEnableControl(enabled, control: txtPassword)
        isEnableControl(enabled, control: btnLogin)
        isEnableControl(enabled, control: btnSignUp)
    }
}
