//
//  CalculatorView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

enum CalculatorState {
    case input, calculating, result
}

struct CalculatorView: View {
    @EnvironmentObject var gameObserver: GameObserver
    @State private var calculatorState: CalculatorState = .input
    @State private var status: FaceStatus = FaceStatus.neutral
    
    var body: some View {
        VStack {
            ZStack {
                CalculatorScreenView()
                FaceView(status: status)
            }
            CalculatorDisplayWasteOutputView(game: $gameObserver.game, calculatorState: $calculatorState)
            CalculatorKeyboardView(game: $gameObserver.game, calculatorState: $calculatorState, faceStatus: $status)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
