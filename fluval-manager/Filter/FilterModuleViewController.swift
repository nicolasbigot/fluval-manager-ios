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
    
    private func updateUI(module: FilterModule?) {
        if let module = module {
            self.statusLabel.text = module.status.description
            module.status == .started ? enableUI() : disableUI()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshButtonPressed()
    }

    
}
