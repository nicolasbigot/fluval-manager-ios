//
//  LightsModels.swift
//  fluval-manager
//
//  Created by Nicolas on 20/02/2017.
//  Copyright © 2017 Nicolas Bigot. All rights reserved.
//

import Foundation

enum LightsState: Int, CustomStringConvertible {
    case off = 0
    case white
    case blue
    
    var description: String {
        switch self {
        case .off: return "OFF"
        case .white: return "White"
        case .blue: return "Blue"
        }
    }
}

enum LightsMode: Int, CustomStringConvertible {
    case automatic = 0
    case manual
    
    var description: String {
        switch self {
        case .automatic: return "Automatic"
        case .manual: return "Manual"
        }
    }
}

struct LightsSchedule {
    
    let duration: Int
    let states: [LightsState]
    
    init?(fromJSON json: [String: AnyObject]) {
        guard let duration = json["duration"] as? NSNumber,
            let rawStates = json["states"] as? [NSNumber]
            else {
                return nil
        }
        
        self.states = rawStates.flatMap({ LightsState.init(rawValue: $0.intValue) })
        self.duration = duration.intValue
        
        guard self.states.count == 24 else { return nil };
    }
    
}

struct LightsModule: JSONInitializable {
    
    let status: ModuleStatus
    let mode: LightsMode?
    let state: LightsState?
    let schedule: LightsSchedule
    
    init?(fromJSON json: [String: AnyObject]) {
        guard let statusNumber = json["status"] as? NSNumber,
            let status = ModuleStatus(rawValue: statusNumber.intValue),
            let scheduleJSON = json["schedule"] as? [String: AnyObject],
            let schedule = LightsSchedule(fromJSON: scheduleJSON)
            else {
                return nil
        }
        
        self.mode = LightsMode(rawValue: (json["mode"] as? NSNumber)?.intValue ?? -1)
        self.state = LightsState(rawValue: (json["state"] as? NSNumber)?.intValue ?? -1)
        self.status = status
        self.schedule = schedule
    }
    
}
