//
//  CalculatorView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorView: View {
    @State private var game: Game = Game()
    @State private var status: FaceStatus = FaceStatus.neutral
    
    var body: some View {
        VStack {
            ZStack {
                CalculatorScreenView()
                FaceView(status: status)
                // TODO: for testing only delete later
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.8)) {
                            status = status.next
                        }
                    }
            }
            CalculatorDisplayWasteOutputView(wasteScore: $game.wasteInputs)
            CalculatorKeyboardView(game: $game)
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .padding()
    }
}
