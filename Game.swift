//
//  Game.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import Foundation

enum ScoreLevel {
    case low, high
}

enum DisplayState {
    case input, result
}

enum CalculatorState {
    case input, calculating, result
}

class Game: ObservableObject {
    @Published var wasteInputs: [WasteParameter] = []
    @Published var calculatorState: CalculatorState = .input

    init(loadTestData: Bool = false) {
        if loadTestData {
            wasteInputs.append(.gazpacho)
            wasteInputs.append(.soundModerate)
            wasteInputs.append(.rain)
            wasteInputs.append(.queueShort)
        }
    }

    func handleWasteButton(waste: WasteParameter) {
        wasteInputs.append(waste)
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
        case 0 ... 8:
            return .low
        default:
            return .high
        }
    }
}
