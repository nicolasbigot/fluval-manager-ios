//
//  TemperatureModuleViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 26/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class TemperatureModuleViewController: ModuleViewController {
    
    var temperatureEndpoint: TemperatureEndpoint!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonPressed() {
        _ = temperatureEndpoint.fetch { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func startButtonPressed() {
        _ = temperatureEndpoint.start { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func stopButtonPressed() {
        _ = temperatureEndpoint.stop { module in
            self.updateUI(module: module)
        }
    }
    
    // MARK : - View
    
    private func updateUI(module: TemperatureModule? = nil) {
        if let module = module {
            self.statusLabel.text = module.status.description
            self.temperatureLabel.text = "\(round(module.temperature * 10) / 10)°C"
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
