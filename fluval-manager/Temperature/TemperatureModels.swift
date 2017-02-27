//
//  TemperatureModels.swift
//  fluval-manager
//
//  Created by Nicolas on 26/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

struct TemperatureModule: JSONInitializable {
    
    let status: ModuleStatus
    let temperature: Float
    
    init?(fromJSON json: [String: AnyObject]) {
        guard let statusNumber = json["status"] as? NSNumber,
            let status = ModuleStatus(rawValue: statusNumber.intValue),
            let temperature = json["temperature"] as? NSNumber
        else {
                return nil
        }
        
        self.status = status
        self.temperature = temperature.floatValue
    }
    
}
