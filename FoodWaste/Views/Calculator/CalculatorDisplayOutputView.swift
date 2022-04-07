//
//  CalculatorDisplayOutputView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorDisplayWasteOutputView: View {
    @Binding var calculatorState: CalculatorState
    
    var body: some View {
        RoundedWasteDisplay(calculatorState: $calculatorState, backgroundColor: Color("CalculatorDisplayOutputColor"))
    }
}

struct CalculatorDisplayOutputView_Previews: PreviewProvider {    
    static var previews: some View {
        VStack {
            Text("Input state")
            CalculatorDisplayWasteOutputView(calculatorState: Binding.constant(.input))
            Text("Result state")
            CalculatorDisplayWasteOutputView(calculatorState: Binding.constant(.result))
        }
    }
}
