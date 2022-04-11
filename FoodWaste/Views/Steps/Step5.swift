//
//  Step5.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-24.
//

import SwiftUI

struct Step5: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var localization: Localization
    @State var responseViewOpacity = 0.0

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("tabletOn")
                    .resizable()
                Image("calculatorBackground")
                    .resizable()
                    .padding()
                CalculatorView()
                    .padding([.horizontal, .vertical], 35)

                ChatBubbleView {
                    ChatBubbleText(text: getResponse().localized(localization.language))
                    HStack {
                        Spacer()
                        ForwardButton(action: {
                            navigation.next()
                        })
                    }
                }
                .opacity(responseViewOpacity)
                .onReceive(game.$calculatorState) { calculatorState in
                    if calculatorState == .result {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                responseViewOpacity = 1.0
                            }
                        }
                    }
                }
                .frame(width: 300)
                .offset(x: geo.size.width * -0.33, y: geo.size.height * -0.23)
            }
            .aspectRatio(0.75, contentMode: .fit)
            .frame(width: geo.size.height * 0.75, height: geo.size.height * 0.75)
            .offset(x: geo.size.width * 0.462, y: geo.size.height * 0.17)
        }
    }

    func getResponse() -> String {
        let sum = game.sumWasteScore()
        let level = game.getScoreLevel(score: sum)
        switch level {
        case .low:
            return "calculationResponseLow"
        case .high:
            return "calculationResponseHigh"
        }
    }
}

struct Step5_Previews: PreviewProvider {
    static var previews: some View {
        Step5()
            .environmentObject(Navigation())
            .environmentObject(Localization())
            .environmentObject(Game())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
