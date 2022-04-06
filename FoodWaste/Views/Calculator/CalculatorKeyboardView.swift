//
//  CalculatorKeyboardView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    @Binding var game: Game
    @Binding var calculatorState: CalculatorState
    @Binding var faceStatus: FaceStatus
    
    var body: some View {
        VStack {
            KeyboardWastParamsView(game: $game)
            KeyboardFunctionsView(game: $game, calculatorState: $calculatorState, faceStatus: $faceStatus)
        }
    }
}

struct CalculatorKeyboardView_Previews: PreviewProvider {
    @State static var game: Game = Game()
    
    static var previews: some View {
        CalculatorKeyboardView(game: $game, calculatorState: Binding.constant(.input), faceStatus: Binding.constant(.neutral))
    }
}
