//
//  CalculatorView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var localization: Localization
    @State private var faceStatus: FaceStatus = .neutral
    
    func getFaceStatus() -> FaceStatus {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        
        switch level {
        case .low:
            return .happy
        case .high:
            return .angry
        }
    }
    
    func getDisplayText() -> Text {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        
        if sum == 0 {
            return Text("calcDisplayGreeting".localized(localization.language))
                .foregroundColor(Color("CalculatorDisplayTextColor"))
        }
        
        switch level {
        case .low:
            return Text("calcDisplayResultLow".localized(localization.language))
                .foregroundColor(Color("ColorGreen"))
        case .high:
            return Text("calcDisplayResultHigh".localized(localization.language))
                .foregroundColor(Color("ColorRed"))
        }
    }
    
    func handleSum() -> Void {
        game.calculatorState = .calculating
        
        withAnimation(.easeInOut(duration: 0.8)) {
            faceStatus = .thinking
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            game.calculatorState = .result
            withAnimation(.easeInOut(duration: 0.8)) {
                faceStatus = getFaceStatus()
            }
        }
    }
    
    func handleDelete() {
        withAnimation(.easeInOut(duration: 0.4)) {
            game.calculatorState = .input
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
            RoundedWasteDisplay(
                textOutput: getDisplayText,
                backgroundColor: Color("CalculatorDisplayOutputColor")
            )
            CalculatorKeyboardView(
                handleSum: { handleSum() },
                handleDelete: { handleDelete() },
                disableSum: game.wasteInputs.count < 4
            )
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Game())
            .environmentObject(Localization())
    }
}
