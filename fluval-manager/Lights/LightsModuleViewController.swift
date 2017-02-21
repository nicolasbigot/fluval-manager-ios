//
//  LightsModuleViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class LightsModuleViewController: ModuleViewController {
    
    var lightsModule: LightsModule!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var modeLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonPressed() {
        _ = lightsModule.fetch { module in
            self.updateUI(module: module)
        }
    }

    @IBAction private func whiteButtonPressed() {
        _ = lightsModule.switchToManualMode(state: .white) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func blueButtonPressed() {
        _ = lightsModule.switchToManualMode(state: .blue) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func automaticButtonPressed() {
        _ = lightsModule.switchToAutomaticMode { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func offButtonPressed() {
        _ = lightsModule.switchToManualMode(state: .off) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func startButtonPressed() {
        _ = lightsModule.start { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func stopButtonPressed() {
        _ = lightsModule.stop { module in
            self.updateUI(module: module)
        }
    }
    
    // MARK : - View

    private func updateUI(module: LightsAPIModule?) {
        if let module = module {
            self.modeLabel.text = "\(module.mode)"
            self.stateLabel.text = "\(module.state)"
            self.statusLabel.text = "\(module.status)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshButtonPressed()
    }
    
}
