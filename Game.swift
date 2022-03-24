//
//  Game.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import Foundation

struct Game {
    var wasteScore: [WasteParameter] = []
    var wasteResult: String = "Å nej, det blir 48 g/elev matsvinn!"
    
    init(loadTestData: Bool = false) {
        if (loadTestData) {
            wasteScore.append(WasteParameter.gazpacho)
        }
    }
    
    mutating func handleWasteButton(waste: WasteParameter) {
        wasteScore.append(waste)
    }
    
    mutating func resetWasteScore() {
        wasteScore.removeAll()
    }
    
    func sumWasteScore() -> () {
        var sumImpact = 0
        
        wasteScore.forEach { waste in
            sumImpact += waste.impact
        }
        
        print(sumImpact)
    }
    
    mutating func handleFunctionButton(function: FunctionParameter) {
        switch function {
        case .delete:
            wasteScore.removeAll()
        case .sum:
            sumWasteScore()
        }
    }
}
