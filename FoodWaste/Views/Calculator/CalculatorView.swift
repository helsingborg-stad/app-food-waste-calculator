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
    @State private var faceStatus: FaceStatus = .neutral
    
    func getFaceStatus() -> FaceStatus {
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
    
    func getDisplayText() -> Text {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        
        if sum == 0 {
            return Text("calcDisplayGreeting".localized(localization.language))
        }
        
        switch level {
        case .low:
            return Text("calcDisplayResultLow".localized(localization.language))
                .foregroundColor(Color("FaceGreenColor"))
        case .medium:
            return Text("calcDisplayResultMedium".localized(localization.language))
                .foregroundColor(Color("FaceYellowColor"))
        case .high:
            return Text("calcDisplayResultHigh".localized(localization.language))
                .foregroundColor(Color("FaceRedColor"))
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            navigation.next()
            game.calculatorState = .input
            faceStatus = .neutral
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
            .environmentObject(Localization())
    }
}
