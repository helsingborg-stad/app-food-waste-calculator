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
    @State private var faceStatus: FaceStatus = .neutral
    
    func updateFaceStatus() -> FaceStatus {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        switch level {
        case .low:
            return .happy
        case .medium:
            return .disappointed
        case .high:
            return .angry
        }
    }
    
    func handleSum() -> Void {
        calculatorState = .calculating
        
        withAnimation(.easeInOut(duration: 0.8)) {
            faceStatus = .thinking
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            calculatorState = .result
            withAnimation(.easeInOut(duration: 0.8)) {
                faceStatus = updateFaceStatus()
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
