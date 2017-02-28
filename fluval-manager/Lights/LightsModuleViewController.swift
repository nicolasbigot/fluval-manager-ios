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
    
    var lightsEndpoint: LightsEndpoint!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var modeLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonPressed() {
        _ = lightsEndpoint.fetch { module in
            self.updateUI(module: module)
        }
    }

    @IBAction private func whiteButtonPressed() {
        _ = lightsEndpoint.switchToManualMode(state: .white) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func blueButtonPressed() {
        _ = lightsEndpoint.switchToManualMode(state: .blue) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func automaticButtonPressed() {
        _ = lightsEndpoint.switchToAutomaticMode { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func offButtonPressed() {
        _ = lightsEndpoint.switchToManualMode(state: .off) { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func startButtonPressed() {
        _ = lightsEndpoint.start { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func stopButtonPressed() {
        _ = lightsEndpoint.stop { module in
            self.updateUI(module: module)
        }
    }
    
    // MARK : - View

    override func updateModuleInfo() {
        super.updateModuleInfo()
        
        refreshButtonPressed()
    }
    
    private func updateUI(module: LightsModule? = nil) {
        if let module = module {
            self.modeLabel.text = module.mode != nil ? module.mode!.description : "--"
            self.stateLabel.text = module.state != nil ? module.state!.description : "--"
            self.statusLabel.text = module.status.description
            module.status == .started ? enableUI() : disableUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
}
