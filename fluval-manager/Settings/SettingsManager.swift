//
//  SettingsManager.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

final class SettingsManager {

    private let defaults = UserDefaults.standard
    
    var username: String {
        get {
            return defaults.string(forKey: "username") ?? ""
        }
        set {
            defaults.set(newValue, forKey: "username")
            defaults.synchronize()
        }
    }
    
    var password: String {
        get {
            return defaults.string(forKey: "password") ?? ""
        }
        set {
            defaults.set(newValue, forKey: "password")
            defaults.synchronize()
        }
    }
    
    var isSetup: Bool {
        return defaults.string(forKey: "username") != nil
    }
    
}
