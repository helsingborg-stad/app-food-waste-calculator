//
//  Game.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import Foundation

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
    
    func sumWasteScore() -> () {
        var sumImpact = 0
        
        wasteInputs.forEach { waste in
            sumImpact += waste.impact
        }
        
        print(sumImpact)
    }
    
    mutating func handleFunctionButton(function: FunctionParameter) {
        switch function {
        case .delete:
            wasteInputs.removeAll()
        case .sum:
            sumWasteScore()
        }
    }
}
