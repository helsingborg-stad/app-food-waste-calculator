//
//  CalculatorDisplayOutputView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorDisplayWasteOutputView: View {
    @Binding var calculatorState: CalculatorState
    var textOutput: () -> Text
    
    var body: some View {
        RoundedWasteDisplay(
            calculatorState: $calculatorState,
            textOutput: textOutput,
            backgroundColor: Color("CalculatorDisplayOutputColor")
        )
    }
}

struct CalculatorDisplayOutputView_Previews: PreviewProvider {    
    static var previews: some View {
        VStack {
            Text("Input state")
            CalculatorDisplayWasteOutputView(calculatorState: Binding.constant(.input), textOutput: { Text("Input state")})
            Text("Result state")
            CalculatorDisplayWasteOutputView(calculatorState: Binding.constant(.result), textOutput: { Text("Result state")})
        }
        .environmentObject(Game())
    }
}
