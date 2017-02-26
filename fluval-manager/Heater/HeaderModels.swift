//
//  HeaderModels.swift
//  fluval-manager
//
//  Created by Nicolas on 26/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

struct HeaterModule: JSONInitializable {
    
    let status: ModuleStatus
    
    init?(fromJSON json: [String: AnyObject]) {
        guard let statusNumber = json["status"] as? NSNumber,
            let status = ModuleStatus(rawValue: statusNumber.intValue)
            else {
                return nil
        }
        
        self.status = status
    }
    
}
