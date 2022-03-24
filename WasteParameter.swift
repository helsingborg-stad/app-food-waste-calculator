//
//  WasteParameter.swift
//  WastParameter
//
//  Created by Ehsan Zilaei on 2022-03-21.
//

import Foundation

enum WasteParameter: String, Identifiable {
    case burger, gazpacho, fish, happy, scare, angry, queueShort, queueModerate, queueLong, clouds, sun, rain
    
    var id: Self { self }
    
    var type: WasteType {
        switch self {
        case .burger, .gazpacho, .fish:
            return .food
        case .scare, .happy, .angry:
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
        case .burger, .angry, .queueLong, .rain:
            return 30
        case .fish, .scare, .queueModerate, .clouds:
            return 20
        case .gazpacho, .happy, .queueShort, .sun:
            return 10
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
