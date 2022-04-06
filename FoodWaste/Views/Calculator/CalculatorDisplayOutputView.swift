//
//  CalculatorDisplayOutputView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorDisplayWasteOutputView: View {
    @Binding var game: Game
    @Binding var calculatorState: CalculatorState
    
    var body: some View {
        RoundedWasteDisplay(game: $game, calculatorState: $calculatorState, backgroundColor: Color("CalculatorDisplayOutputColor"))
    }
}

struct CalculatorDisplayOutputView_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        VStack {
            Text("Input state")
            CalculatorDisplayWasteOutputView(game: $game, calculatorState: Binding.constant(.input))
            Text("Result state")
            CalculatorDisplayWasteOutputView(game: $game, calculatorState: Binding.constant(.result))
        }
    }
}
