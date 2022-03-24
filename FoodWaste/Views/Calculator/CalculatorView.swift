//
//  CalculatorView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorView: View {
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            CalculatorFaceView(images: [])
            CalculatorDisplayWasteOutputView(wasteScore: $game.wasteScore)
            CalculatorKeyboardView(game: $game)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .padding()
    }
}
