//
//  BackgroundView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var localization: Localization

    var body: some View {
        ZStack {
            Color.clear.overlay(
                Image("background")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    HStack {
                        ForEach(Language.allCases) { language in
                            if language != localization.language {
                                LanguageButton(text: language.flag, action: { localization.setLanguage(lang: language)
                                })
                            }
                        }
                    }
                    .offset(x: 70, y: 0)
                    Spacer()
                    if navigation.step > 0 {
                        ResetButton(action: { navigation.reset() })
                            .offset(x: -70, y: 0)
                    }
                }
                Spacer()
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                .previewDisplayName("iPad Pro (12.9-inch)")
                .previewInterfaceOrientation(.landscapeLeft)
                .environment(\.locale, .init(identifier: "sv"))

            BackgroundView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air (4th generation)")
                .previewInterfaceOrientation(.landscapeLeft)

            BackgroundView()
                .previewDevice(PreviewDevice(rawValue: "iPad (9th generation)"))
                .previewDisplayName("iPad (9th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
        }
        .environmentObject(Navigation())
        .environmentObject(Localization())
    }
}
