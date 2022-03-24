//
//  KeyboardFunctionsView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct KeyboardFunctionsView: View {
    @Binding var game: Game
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            Group {
                RoundedFunctionButton(game: $game, function: .delete)
                Spacer()
                RoundedFunctionButton(game: $game, function: .sum)
            }
        }
    }
}

struct KeyboardFunctionsView_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        KeyboardFunctionsView(game: $game)
    }
}
