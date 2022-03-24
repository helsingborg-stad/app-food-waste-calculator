//
//  KeyboardWastParamView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct KeyboardWastParamsView: View {
    @Binding var game: Game
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            Group {
                RoundedWasteButton(game: $game, waste: .burger)
                RoundedWasteButton(game: $game, waste: .gazpacho)
                RoundedWasteButton(game: $game, waste: .fish)
            }
            
            Group {
                RoundedWasteButton(game: $game, waste: .happy)
                RoundedWasteButton(game: $game, waste: .scare)
                RoundedWasteButton(game: $game, waste: .angry)
            }

            Group {
                RoundedWasteButton(game: $game, waste: .queue)
                RoundedWasteButton(game: $game, waste: .queue)
                RoundedWasteButton(game: $game, waste: .queue)
            }

            Group {
                RoundedWasteButton(game: $game, waste: .clouds)
                RoundedWasteButton(game: $game, waste: .sun)
                RoundedWasteButton(game: $game, waste: .rain)
            }
        }
    }
}

struct KeyboardWastParamView_Previews: PreviewProvider {
    @State static var game: Game = Game()
    
    static var previews: some View {
        KeyboardWastParamsView(game: $game)
    }
}
