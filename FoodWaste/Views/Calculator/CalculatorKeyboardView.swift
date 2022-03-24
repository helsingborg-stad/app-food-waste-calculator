//
//  CalculatorKeyboardView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            KeyboardWastParamsView(game: $game)
            KeyboardFunctionsView(game: $game)
        }
    }
}

struct CalculatorKeyboardView_Previews: PreviewProvider {
    @State static var game: Game = Game()
    
    static var previews: some View {
        CalculatorKeyboardView(game: $game)
    }
}
