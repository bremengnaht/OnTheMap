//
//  UIViewControlerExtension.swift
//  OnTheMap
//
//  Created by Nguyen Quyet Thang on 20/7/24.
//

import Foundation
import UIKit

extension UIViewController {
    /// Change control state and style also
    func isEnableControl(_ enabled: Bool, control: UIControl) {
        if enabled {
            control.isEnabled = true
            control.alpha = 1.0
        } else {
            control.isEnabled = false
            control.alpha = 0.8
        }
    }
    
}