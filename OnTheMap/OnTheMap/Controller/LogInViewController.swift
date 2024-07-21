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
    
    //MARK: IBAction
    
    @IBAction func login(_ sender: UIButton) {
        enableLogInControls(false)
        UdacityClient.login(email: txtEmail.text ?? "", password: txtPassword.text ?? "", completion: handleLoginResponse(response:error:))
    }
    
    @IBAction func signUp(_ sender: Any) {
        UdacityClient.signUp()
    }
    
    //MARK: Func
    func handleLoginResponse(response: LoginResponse?, error: Error?) -> Void {
        if let response = response {
            self.performSegue(withIdentifier: "loginSuccessSegue", sender: nil)
        } else {
            showAlert(title: "Login Failed", message: (error as! ErrorResponse).error)
        }
        enableLogInControls(true)
    }
    
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        show(alertVC, sender: nil)
    }
    
    func enableLogInControls(_ enabled: Bool) -> Void {
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
