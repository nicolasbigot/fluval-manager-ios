//
//  SettingsViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class SettingsViewController: UIViewController {
    
    var settingsManager: SettingsManager!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = settingsManager.username
        passwordTextField.text = settingsManager.password
    }
    
    @IBAction func saveButtonTouched(_ sender: Any) {
        settingsManager.username = usernameTextField.text ?? ""
        settingsManager.password = passwordTextField.text ?? ""
        dismiss(animated: true)
    }
    
}
