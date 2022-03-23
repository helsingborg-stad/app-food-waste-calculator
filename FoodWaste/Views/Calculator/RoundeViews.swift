//
//  RoundeViews.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-16.
//

import SwiftUI

struct RoundedRectView: View {
    var backgroundColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(backgroundColor)
    }
}

struct RoundedWasteDisplay: View {
    @Binding var wasteItems: [WasteParameter]
    var backgroundColor: Color
    
    var body: some View {
        HStack (alignment: .center) {
            ForEach (wasteItems) {waste in
                Image(waste.image)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct RoundedWasteButton: View {
    @Binding var game: Game
    var waste: WasteParameter
    
    var body: some View {
        let typeSelected = game.wasteScore.contains {$0.type == waste.type}
        let wasteSelected = game.wasteScore.contains {$0.type == waste.type && $0 != waste}
        
        HStack (alignment: .center) {
            Button(action: {game.addWasteScore(waste: waste)}) {
                Image(waste.image)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color(waste.type.color))
        .cornerRadius(10)
        .opacity(wasteSelected ? 0.5 : 1)
        .disabled(typeSelected ? true : false)
    }
}

struct RoundeViews_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        VStack (spacing: 20) {
            Text("Displays:")
            RoundedWasteDisplay(wasteItems: $game.wasteScore, backgroundColor: Color("CalculatorDisplayOutputColor"))
            Text("Buttons:")
            RoundedWasteButton(game: $game, waste: .burger)
            RoundedWasteButton(game: $game, waste: .gazpacho)
        }
        .padding()
    }
}
