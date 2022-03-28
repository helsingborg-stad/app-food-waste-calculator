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
                RoundedWasteButton(game: $game, waste: .soundLow)
                RoundedWasteButton(game: $game, waste: .soundModerate)
                RoundedWasteButton(game: $game, waste: .soundHigh)
            }

            Group {
                RoundedWasteButton(game: $game, waste: .queueShort)
                RoundedWasteButton(game: $game, waste: .queueModerate)
                RoundedWasteButton(game: $game, waste: .queueLong)
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
