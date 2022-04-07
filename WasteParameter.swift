//
//  WasteParameter.swift
//  WastParameter
//
//  Created by Ehsan Zilaei on 2022-03-21.
//

import Foundation

enum WasteParameter: String, Identifiable {
    case burger, gazpacho, fish, soundLow, soundModerate, soundHigh, queueShort, queueModerate, queueLong, clouds, sun, rain
    
    var id: Self { self }
    
    var type: WasteType {
        switch self {
        case .burger, .gazpacho, .fish:
            return .food
        case  .soundLow, .soundModerate, .soundHigh:
            return .sound
        case .queueShort, .queueModerate, .queueLong:
            return .queue
        case .clouds, .sun, .rain:
            return .weather
        }
    }
    
    var image: String {
        switch self {
        default:
            return self.rawValue
        }        
    }
    
    var impact: Int {
        switch self {
        case .burger, .soundHigh, .queueLong, .sun:
            return 3
        case .fish, .soundModerate, .queueModerate, .clouds:
            return 2
        case .gazpacho, .soundLow, .queueShort, .rain:
            return 1
        }
    }
}

enum WasteType {
    case food, sound, queue, weather
    
    var color: String {
        switch self {
        case .food:
            return "ButtonColorPurple"
        case .sound:
            return "ButtonColorGreen"
        case .queue:
            return "ButtonColorOrange"
        case .weather:
            return "ButtonColorBlue"
        }
    }
}
