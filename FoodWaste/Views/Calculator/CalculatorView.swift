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
    @State private var game: Game = Game()
    @State private var calculatorState: CalculatorState = .input
    @State private var status: FaceStatus = FaceStatus.neutral
    
    var body: some View {
        VStack {
            ZStack {
                CalculatorScreenView()
                FaceView(status: status)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            status = status.next
                        }
                    }
            }
            CalculatorDisplayWasteOutputView(game: $game, calculatorState: $calculatorState)
            CalculatorKeyboardView(game: $game, calculatorState: $calculatorState, faceStatus: $status)
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
