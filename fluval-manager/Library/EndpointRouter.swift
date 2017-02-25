//
//  EndpointRouter.swift
//  fluval-manager
//
//  Created by Nicolas on 20/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

struct EndpointRouter {
    
    private static let baseURL = "https://fluval.nicolasbigot.com"

    static func routeFromAPI(moduleName: String, to: String? = nil) -> URL {
        return appendPath(path: "/api/\(moduleName)\(to ?? "")")
    }
    
    private static func appendPath(path: String) -> URL {
        return URL(string: baseURL)!.appendingPathComponent(path)
    }
    
}
