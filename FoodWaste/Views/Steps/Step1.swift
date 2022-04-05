//
//  Step1.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step1: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        GeometryReader { geo in
            ChatBubbleView {
                ChatBubbleText(text: "Hej, vill du hjälpa mig att\nplanera skolmaten? \n\nVi vill akta oss för matsvinn!")
                HStack {
                    Spacer()
                    ForwardButton(action: { navigation.next() })
                }
            }
            .offset(x: geo.size.width * 0.47, y: geo.size.height * 0.21)
        }
    }
}

struct Step1_Previews: PreviewProvider {
    static var previews: some View {
        Step1()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation())
    }
}
