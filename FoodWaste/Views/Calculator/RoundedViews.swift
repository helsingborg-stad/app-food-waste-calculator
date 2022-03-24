//
//  RoundedViews.swift
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
        
        Button(action: {game.handleWasteButton(waste: waste)}) {
            HStack (alignment: .center) {
                Image(waste.image)
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color(waste.type.color))
            .cornerRadius(10)
            .opacity(wasteSelected ? 0.5 : 1)
            .disabled(typeSelected ? true : false)
        }
    }
}

struct RoundedFunctionButton: View {
    @Binding var game: Game
    var function: FunctionParameter
    
    var body: some View {
        Button(action: { game.handleFunctionButton(function: function) }) {
            HStack (alignment: .center) {
                Image(systemName: function.image)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(Color(function.type.color))
            .cornerRadius(10)
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        ScrollView {
            VStack (spacing: 20) {
                Text("Displays:")
                RoundedWasteDisplay(wasteItems: $game.wasteScore, backgroundColor: Color("CalculatorDisplayOutputColor"))
                Text("Waste Buttons disabled:")
                RoundedWasteButton(game: $game, waste: .burger)
                Text("Waste Buttons enabled:")
                RoundedWasteButton(game: $game, waste: .gazpacho)
                Text("Function Buttons:")
                RoundedFunctionButton(game: $game, function: .delete)
                RoundedFunctionButton(game: $game, function: .sum)
            }
            .padding()
        }
    }
}
