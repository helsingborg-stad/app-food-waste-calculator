//
//  KeyboardFunctionsView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct KeyboardFunctionsView: View {
    @EnvironmentObject var navigation: Navigation
    @Binding var game: Game
    @Binding var calculatorState: CalculatorState
    @Binding var faceStatus: FaceStatus
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    func handleDeleteAction() {
        withAnimation(.easeInOut(duration: 0.4)) {
            calculatorState = .input
            faceStatus = .neutral
        }
        game.removeAllWasteInputs()
    }
    
    func handleSumAction() {
        calculatorState = .calculating
        
        withAnimation(.easeInOut(duration: 0.8)) {
            faceStatus = .thinking
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            calculatorState = .result
            withAnimation(.easeInOut(duration: 0.8)) {
                faceStatus = .angry
                
                let wasteResult = game.sumWasteScore()
                if (wasteResult <= 6) {
                    faceStatus = .happy
                } else if (wasteResult >= 7 && wasteResult <= 10 ) {
                    faceStatus = .disappointed
                } else if (wasteResult > 10) {
                    faceStatus = .angry
                } else {
                    faceStatus = .happy
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15.0) {
            navigation.next()
            calculatorState = .input
            faceStatus = .neutral
            game.removeAllWasteInputs()
        }
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            Group {
                RoundedFunctionButton(function: .delete, buttonAction: { handleDeleteAction() })
                Spacer()
                RoundedFunctionButton(function: .sum, buttonAction: { handleSumAction() })
            }
        }
    }
}

struct KeyboardFunctionsView_Previews: PreviewProvider {
    @State static var game: Game = Game(loadTestData: true)
    
    static var previews: some View {
        KeyboardFunctionsView(game: $game, calculatorState: Binding.constant(.input), faceStatus: Binding.constant(.neutral))
    }
}
