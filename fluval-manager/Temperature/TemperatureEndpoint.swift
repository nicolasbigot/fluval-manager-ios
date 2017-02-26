//
//  TemperatureEndpoint.swift
//  fluval-manager
//
//  Created by Nicolas on 26/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import Alamofire

final class TemperatureEndpoint: ModuleEndpoint<TemperatureModule> {
    
    override var name: String { return "temperature" }
    
}
