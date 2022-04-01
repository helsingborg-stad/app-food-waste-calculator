//
//  Game.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import Foundation

enum ScoreLevel {
    case low, medium, high
}

enum DisplayState {
    case input, result
}

class Game: ObservableObject {
    @Published var wasteInputs: [WasteParameter] = []
    
    init(loadTestData: Bool = false) {
        if (loadTestData) {
            wasteInputs.append(.gazpacho)
            wasteInputs.append(.soundModerate)
            wasteInputs.append(.rain)
            wasteInputs.append(.queueShort)
        }
    }

    func handleWasteButton(waste: WasteParameter) {
        wasteInputs.append(waste)
    }
    
    func resetWasteScore() {
        wasteInputs.removeAll()
    }
    
    func sumWasteScore() -> Int {
        var sumImpact = 0
        
        wasteInputs.forEach { waste in
            sumImpact += waste.impact
        }
        
        return sumImpact
    }
    
    func removeAllWasteInputs() {
        wasteInputs.removeAll()
    }
    
    func getScoreLevel(score: Int) -> ScoreLevel {
        switch score {
        case 0...6:
            return .low
        case 7...9:
            return .medium
        default:
            return .high
        }
    }
    
    func getScoreLevel(score: Int) -> ScoreLevel {
        switch score {
        case 0...6:
            return .low
        case 7...9:
            return .medium
        default:
            return .high
        }
    }
}
