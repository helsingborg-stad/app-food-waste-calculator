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

struct Game {
    var wasteInputs: [WasteParameter] = []
    
    init(loadTestData: Bool = false) {
        if (loadTestData) {
            wasteInputs.append(.queueLong)
        }
    }

    mutating func handleWasteButton(waste: WasteParameter) {
        wasteInputs.append(waste)
    }
    
    mutating func resetWasteScore() {
        wasteInputs.removeAll()
    }
    
    func sumWasteScore() -> Int {
        var sumImpact = 0
        
        wasteInputs.forEach { waste in
            sumImpact += waste.impact
        }
        
        return sumImpact
    }
    
    mutating func handleFunctionButton(function: FunctionParameter) {
        switch function {
        case .delete:
            wasteInputs.removeAll()
        case .sum:
            print(sumWasteScore())
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
