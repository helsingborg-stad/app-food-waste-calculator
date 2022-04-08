//
//  CalculatorDisplayOutputView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorDisplayWasteOutputView: View {
    var textOutput: () -> Text

    var body: some View {
        RoundedWasteDisplay(
            textOutput: textOutput,
            backgroundColor: Color("CalculatorDisplayOutputColor")
        )
    }
}

struct CalculatorDisplayOutputView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Input state")
            CalculatorDisplayWasteOutputView(textOutput: { Text("Input state") })
            Text("Result state")
            CalculatorDisplayWasteOutputView(textOutput: { Text("Result state") })
        }
        .environmentObject(Game())
    }
}
