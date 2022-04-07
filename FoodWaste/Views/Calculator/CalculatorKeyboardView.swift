//
//  CalculatorKeyboardView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorKeyboardView: View {
    var handleSum: () -> Void
    var handleDelete: () -> Void
    
    var body: some View {
        VStack {
            KeyboardWastParamsView()
            KeyboardFunctionsView(handleSum: { handleSum() }, handleDelete: { handleDelete() })
        }
    }
}

struct CalculatorKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorKeyboardView(handleSum:{}, handleDelete: {})
            .environmentObject(Game())
    }
}
