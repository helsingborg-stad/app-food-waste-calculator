//
//  RoundedViews.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-16.
//

import SwiftUI

struct RoundedWasteDisplay: View {
    @EnvironmentObject var game: Game
    var textOutput: () -> Text = { Text("N/A") }
    var backgroundColor: Color
    
    var body: some View {
        HStack (alignment: .center) {
            switch game.calculatorState {
            case .input:
                if game.wasteInputs.isEmpty {
                    textOutput()
                        .font(.system(size: 25, weight: .bold))
                } else {
                    ForEach (game.wasteInputs) { waste in
                        Image(waste.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 35)
                        
                        if waste != game.wasteInputs.last {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                    }
                }
            case .calculating:
                Text("Beräknar")
                    .font(.largeTitle)
                    .textCase(.uppercase)
            case .result:
                textOutput()
                    .font(.system(size: 25, weight: .bold))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct RoundedButton: View {
    var buttonAction: () -> Void
    var buttonImage: Image
    var buttonBackgroundColor: Color
    var imageFrameHeight: CGFloat = 40
    
    var body: some View {
        Button(action: { buttonAction() }) {
            HStack (alignment: .center) {
                buttonImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: imageFrameHeight)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(buttonBackgroundColor)
            .cornerRadius(10)
        }
    }
}

struct RoundedWasteButton: View {
    @EnvironmentObject var game: Game
    var waste: WasteParameter
    
    var body: some View {
        let wasteSelected = game.wasteInputs.contains {$0.type == waste.type && $0 != waste}
        let typeSelected = game.wasteInputs.contains {$0.type == waste.type}
        
        RoundedButton(
            buttonAction: {game.handleWasteButton(waste: waste)},
            buttonImage: Image(waste.image),
            buttonBackgroundColor: Color(waste.type.color)
        )
            .opacity(wasteSelected ? 0.5 : 1)
            .shadow(color: wasteSelected ? .gray : .black, radius: 5, x: 4, y:  4)
            .disabled(typeSelected ? true : false)
    }
}

struct RoundedFunctionButton: View {
    var function: FunctionParameter
    var buttonAction: () -> Void
    
    var body: some View {
        RoundedButton(
            buttonAction: buttonAction,
            buttonImage: Image(function.image),
            buttonBackgroundColor: Color(function.type.color),
            imageFrameHeight: 25
        )
            .foregroundColor(.black)
            .shadow(color: .black, radius: 5, x: 4, y: 4)
    }
}

struct RoundedViews_Previews: PreviewProvider {    
    static var previews: some View {
        ScrollView {
            VStack (spacing: 20) {
                Group {
                    Text("Display inputs:")
                    RoundedWasteDisplay(backgroundColor: Color("CalculatorDisplayOutputColor"))
                    RoundedWasteDisplay(backgroundColor: Color("CalculatorDisplayOutputColor"))
                    RoundedWasteDisplay(backgroundColor: Color("CalculatorDisplayOutputColor"))
                }
                Group {
                    Text("Waste Buttons disabled:")
                    RoundedWasteButton(waste: .burger)
                    Text("Waste Buttons enabled:")
                    RoundedWasteButton(waste: .gazpacho)
                }
                Group {
                    Text("Function Buttons:")
                    RoundedFunctionButton(function: .sum, buttonAction: {})
                    RoundedFunctionButton(function: .delete, buttonAction: {})
                }
            }
            .padding()
            .environmentObject(Game())
        }
    }
}
