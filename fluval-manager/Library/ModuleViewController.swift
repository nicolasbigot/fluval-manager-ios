//
//  ModuleViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 21/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

class ModuleViewController: UIViewController {
    
    func disableUI() {
        self.view.alpha = 0.5
    }
    
    func enableUI() {
        self.view.alpha = 1.0
    }
    
}
