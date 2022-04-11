//
//  KeyboardFunctionsView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct KeyboardFunctionsView: View {
    var handleSum: () -> Void
    var handleDelete: () -> Void
    var disableSum: () -> Bool = { false }
    @State private var disableFunctionKeys = false
    
    func handleSumAction() {
        disableFunctionKeys = true
        handleSum()
    }
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
        
        LazyVGrid(columns: columns, spacing: 5) {
            Group {
                RoundedFunctionButton(function: .delete, buttonAction: { handleDelete() })
                Spacer()
                RoundedFunctionButton(function: .sum, buttonAction: { handleSumAction() }, disableButton: disableSum)
            }
            .disabled(disableFunctionKeys)
        }
    }
}

struct KeyboardFunctionsView_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        KeyboardFunctionsView(handleSum: {}, handleDelete: {})
    }
}
