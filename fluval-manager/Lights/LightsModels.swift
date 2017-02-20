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
        case .off: return "off"
        case .white: return "white"
        case .blue: return "blue"
        }
    }
}

enum LightsMode: Int, CustomStringConvertible {
    case automatic = 0
    case manual
    
    var description: String {
        switch self {
        case .automatic: return "automatic"
        case .manual: return "manual"
        }
    }
}

struct LightsAPISchedule {
    
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

struct LightsAPIModule {
    
    let status: Bool
    let mode: LightsMode?
    let state: LightsState?
    let schedule: LightsAPISchedule
    
    init?(fromJSON json: [String: AnyObject]) {
        guard let status = json["status"] as? NSNumber,
            let scheduleJSON = json["schedule"] as? [String: AnyObject],
            let schedule = LightsAPISchedule(fromJSON: scheduleJSON)
            else {
                return nil
        }
        
        self.mode = LightsMode(rawValue: (json["mode"] as? NSNumber)?.intValue ?? -1)
        self.state = LightsState(rawValue: (json["state"] as? NSNumber)?.intValue ?? -1)
        self.status = status.boolValue
        self.schedule = schedule
    }
    
}
