//
//  Step3.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step3: View {
    @EnvironmentObject var navigation: Navigation
    @EnvironmentObject var localization: Localization
    var body: some View {
        GeometryReader { geo in
            ChatBubbleView {
                ChatBubbleText(text: "step3".localized(localization.language))
                HStack {
                    Spacer()
                    ForwardButton(action: { navigation.next() })
                }
            }
            .offset(x: geo.size.width * 0.47, y: geo.size.height * 0.16)
        }
    }
}

struct Step3_Previews: PreviewProvider {
    static var previews: some View {
        Step3()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation()).environmentObject(Localization())
    }
}
