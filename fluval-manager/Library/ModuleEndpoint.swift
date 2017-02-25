//
//  ModuleEndpoint.swift
//  fluval-manager
//
//  Created by Nicolas on 25/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import Alamofire

enum ModuleStatus: Int, CustomStringConvertible {
    case stopped = 0
    case started
    
    var description: String {
        switch self {
        case .stopped: return "Stopped"
        case .started: return "Started"
        }
    }
}

class ModuleEndpoint<ModuleClass: JSONInitializable> {
    
    private(set) var settingsManager: SettingsManager
    var name: String { return "" }
    
    init(settingsManager: SettingsManager) {
        self.settingsManager = settingsManager
    }
    
    func start(completion: @escaping (ModuleClass?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.routeFromAPI(moduleName: name, to: "/start"), method: .post)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(ModuleClass(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func stop(completion: @escaping (ModuleClass?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.routeFromAPI(moduleName: name, to: "/stop"), method: .post)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(ModuleClass(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func fetch(completion: @escaping (ModuleClass?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.routeFromAPI(moduleName: name), method: .get)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(ModuleClass(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
}
