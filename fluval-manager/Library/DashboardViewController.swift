//
//  DashboardViewController.swift
//  fluval-manager
//
//  Created by Nicolas on 21/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import UIKit

final class DashboardViewController: UIViewController {
    
    var settingsManager: SettingsManager!
    var modulesViewControllers: [ModuleViewController] = []
    
    @IBOutlet private weak var scrollView: UIScrollView!
    private static let showSettingsViewControllerIdentifier = "ShowSettingsViewController"
    
    // MARK: - Interface
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == type(of: self).showSettingsViewControllerIdentifier {
            if let navigationController = segue.destination as? UINavigationController,
                let viewController = navigationController.topViewController as? SettingsViewController {
                viewController.settingsManager = settingsManager
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !settingsManager.isSetup {
            performSegue(withIdentifier: type(of: self).showSettingsViewControllerIdentifier, sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildInterface()
    }
    
    private func buildInterface() {
        var previousController: UIViewController? = nil
        var totalHeight: CGFloat = 0
        
        for controller in modulesViewControllers {
            addChildViewController(controller)
            scrollView.addSubview(controller.view)
            controller.view.frame = CGRect(x: 0, y: previousController?.view.bounds.height ?? 0, width: scrollView.bounds.width, height: 160)
            previousController = controller
            totalHeight += controller.view.bounds.height
        }
        view.setNeedsLayout()
        scrollView.contentSize = CGSize(width: view.bounds.size.width, height: totalHeight)
    }
    
}
