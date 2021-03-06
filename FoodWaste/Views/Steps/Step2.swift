//
//  Step2.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step2: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var localization: Localization
    var body: some View {
        GeometryReader { geo in
            ChatBubbleView(content:
                Group {
                    HStack(spacing: 15) {
                        Image("gazpacho")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("speaker")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("scare")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("queue")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("sun")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("clouds")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(height: 70)
                    ChatBubbleText(text: "step2".localized(localization.language))
                    HStack {
                        Spacer()
                        ForwardButton(action: { navigation.next() })
                    }
                }
            )
            .offset(x: geo.size.width * 0.47, y: geo.size.height * 0.16)
        }
    }
}

struct Step2_Previews: PreviewProvider {
    static var previews: some View {
        Step2()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation()).environmentObject(Localization())
    }
}
