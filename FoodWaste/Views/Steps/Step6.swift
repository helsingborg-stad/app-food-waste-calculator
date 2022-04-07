//
//  Step6.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-25.
//

import SwiftUI

struct Step6: View {
    @EnvironmentObject var gameObserver: GameObserver
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
    
    func getLevelMessage() -> String {
        let sum = gameObserver.game.sumWasteScore()
        let level = gameObserver.game.getScoreLevel(score: sum)
        switch level {
        case .low:
            return "En dag med 28g matsvinn/elev är lite matsvinn.\n\nVill du prova igen?"
        case .medium:
            return "En dag med 38g matsvinn/elev är medel?? matsvinn.\n\nVill du prova igen?"
        case .high:
            return "En dag med 48g matsvinn/elev är mycket matsvinn.\n\nDå behöver vi beställa mindre mat så att vi inte behöver kasta mat i onödan.\n\nVill du prova igen?"
        }
    }
}

struct Step6_Previews: PreviewProvider {    
    static var previews: some View {
        Step6()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(Navigation())
            .environmentObject(GameObserver())
    }
}
