//
//  LightsEndpoint.swift
//  fluval-manager
//
//  Created by Nicolas on 19/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation
import Alamofire

final class LightsEndpoint: ModuleEndpoint<LightsModule> {
    
    override var name: String { return "lights" }
    
    func switchToAutomaticMode(completion: @escaping (LightsModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.routeFromAPI(moduleName: name, to: "/mode"), method: .put, parameters: ["mode": LightsMode.automatic.rawValue], encoding: JSONEncoding.default)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
    func switchToManualMode(state: LightsState, completion: @escaping (LightsModule?) -> Void) -> DataRequest {
        return Alamofire.request(EndpointRouter.routeFromAPI(moduleName: name, to: "/mode"), method: .put, parameters: ["mode": LightsMode.manual.rawValue, "state": state.rawValue], encoding: JSONEncoding.default)
            .validate()
            .authenticate(user: settingsManager.username, password: settingsManager.password)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(LightsModule(fromJSON: (value as? [String: AnyObject]) ?? [:]))
                default:
                    completion(nil)
                }
        }
    }
    
}
