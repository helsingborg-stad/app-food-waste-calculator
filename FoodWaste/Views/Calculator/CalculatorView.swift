//
//  CalculatorView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

enum CalculatorState {
    case input, calculating, result
}

struct CalculatorView: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var navigation: Navigation
    @State private var calculatorState: CalculatorState = .input
    @State private var faceStatus: FaceStatus = FaceStatus.neutral
    
    func handleSum() -> Void {
        calculatorState = .calculating
        
        withAnimation(.easeInOut(duration: 0.8)) {
            faceStatus = .thinking
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            navigation.next()
            calculatorState = .input
            faceStatus = .neutral
        }
    }
    
    func handleDelete() -> Void {
        withAnimation(.easeInOut(duration: 0.4)) {
            calculatorState = .input
            faceStatus = .neutral
        }
        game.removeAllWasteInputs()
    }
    
    var body: some View {
        VStack {
            ZStack {
                CalculatorScreenView()
                FaceView(status: faceStatus)
            }
            CalculatorDisplayWasteOutputView(calculatorState: $calculatorState)
            CalculatorKeyboardView(handleSum: {handleSum()}, handleDelete: {handleDelete()})
        }
        .onAppear {
            game.removeAllWasteInputs()
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Game())
    }
}
