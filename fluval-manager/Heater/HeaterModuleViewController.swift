//
//  HeaterModuleViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 26/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class HeaterModuleViewController: ModuleViewController {
    
    var heaterEndpoint: HeaterEndpoint!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var onLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonPressed() {
        _ = heaterEndpoint.fetch { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func startButtonPressed() {
        _ = heaterEndpoint.start { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func stopButtonPressed() {
        _ = heaterEndpoint.stop { module in
            self.updateUI(module: module)
        }
    }
    
    // MARK : - View
    
    private func updateUI(module: HeaterModule? = nil) {
        if let module = module {
            self.statusLabel.text = module.status.description
            self.onLabel.text = module.status == .started ? "ON" : "OFF"
            module.status == .started ? enableUI() : disableUI()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
}
