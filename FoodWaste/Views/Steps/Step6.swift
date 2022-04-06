//
//  Step6.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-25.
//

import SwiftUI

struct Step6: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        GeometryReader { geo in
            ChatBubbleView {
                ChatBubbleText(text: getLevelMessage())
                HStack {
                    Spacer()
                    ForwardButton(action: { navigation.previous() })
                }
            }
            .offset(x: geo.size.width * 0.45, y: geo.size.height * 0.21)
        }
    }

    func getLevelMessage() -> LocalizedStringKey {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        switch level {
        case .low:
            return "calculationResultLow"
        case .medium:
            return "calculationResultMedium"
        case .high:
            return "calculationResultHigh"
        }
    }
}

struct Step6_Previews: PreviewProvider {
    @State static var game: Game = .init(loadTestData: true)

    static var previews: some View {
        Step6()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Navigation())
            .environmentObject(Game())
    }
}
