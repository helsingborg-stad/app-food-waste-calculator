//
//  Step3.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step3: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        GeometryReader { geo in
            ChatBubbleView {
                ChatBubbleText(text: "AI-kompisen matkalkylatorn hjälper oss.\n\nNu provar vi tillsammans!")
                HStack {
                    Spacer()
                    ForwardButton(action: { navigation.next() })
                }
            }
            .offset(x: geo.size.width * 0.45, y: geo.size.height * 0.21)
        }
    }
}

struct Step3_Previews: PreviewProvider {
    static var previews: some View {
        Step3()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation())
    }
}
