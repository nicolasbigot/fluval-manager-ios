//
//  LightsModule.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import Alamofire

final class LightsModule {
    
    private let settingsManager: SettingsManager

    init(settingsManager: SettingsManager) {
        self.settingsManager = settingsManager
    }

    func start(completion: @escaping (LightsAPIModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.api.lights.start, method: .post)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsAPIModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func stop(completion: @escaping (LightsAPIModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.api.lights.stop, method: .post)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsAPIModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func fetch(completion: @escaping (LightsAPIModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.api.lights.module, method: .get)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsAPIModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func switchToAutomaticMode(completion: @escaping (LightsAPIModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.api.lights.mode, method: .put, parameters: ["mode": LightsMode.automatic.rawValue], encoding: JSONEncoding.default)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsAPIModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func switchToManualMode(state: LightsState, completion: @escaping (LightsAPIModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.api.lights.mode, method: .put, parameters: ["mode": LightsMode.manual.rawValue, "state": state.rawValue], encoding: JSONEncoding.default)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsAPIModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
}
