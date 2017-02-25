//
//  JSONInitializable.swift
//  fluval-manager
//
//  Created by Nicolas on 25/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

protocol JSONInitializable {
    
    init?(fromJSON json: [String: AnyObject])
    
}
