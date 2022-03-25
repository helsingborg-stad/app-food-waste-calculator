//
//  CalculatorDisplayOutputView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorDisplayWasteOutputView: View {
    @Binding var wasteScore: [WasteParameter]
    
    var body: some View {
        RoundedWasteDisplay(wasteItems: $wasteScore, backgroundColor: Color("CalculatorDisplayOutputColor"))
    }
}

struct CalculatorDisplayOutputView_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        CalculatorDisplayWasteOutputView(wasteScore: $game.wasteInputs)
    }
}
