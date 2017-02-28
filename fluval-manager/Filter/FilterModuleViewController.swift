//
//  FilterModuleViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 25/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class FilterModuleViewController: ModuleViewController {

    var filterEndpoint: FilterEndpoint!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var onLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction private func refreshButtonPressed() {
        _ = filterEndpoint.fetch { module in
            self.updateUI(module: module)
        }
    }

    @IBAction private func startButtonPressed() {
        _ = filterEndpoint.start { module in
            self.updateUI(module: module)
        }
    }
    
    @IBAction private func stopButtonPressed() {
        _ = filterEndpoint.stop { module in
            self.updateUI(module: module)
        }
    }
    
    // MARK : - View
    
    override func updateModuleInfo() {
        super.updateModuleInfo()
        
        refreshButtonPressed()
    }
    
    private func updateUI(module: FilterModule? = nil) {
        if let module = module {
            self.statusLabel.text = module.status.description
            self.onLabel.text = module.status == .started ? "ON" : "OFF"
            module.status == .started ? enableUI() : disableUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
}
