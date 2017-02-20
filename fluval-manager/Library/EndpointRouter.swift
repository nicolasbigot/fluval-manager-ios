//
//  EndpointRouter.swift
//  fluval-manager
//
//  Created by Nicolas on 20/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

struct EndpointRouter {
    
    static let baseURL = "https://fluval.nicolasbigot.com"

    struct api {
        
        struct lights {
            
            static var module: URL { return EndpointRouter.appendPath(path: "/api/lights")  }
            static var start: URL { return EndpointRouter.appendPath(path: "/api/lights/start")  }
            static var stop: URL { return EndpointRouter.appendPath(path: "/api/lights/stop")  }
            static var mode: URL { return EndpointRouter.appendPath(path: "/api/lights/mode")  }
            static var schedule: URL { return EndpointRouter.appendPath(path: "/api/lights/schedule")  }
            
        }
        
    }
    
    private static func appendPath(path: String) -> URL {
        return URL(string: baseURL)!.appendingPathComponent(path)
    }
    
}
