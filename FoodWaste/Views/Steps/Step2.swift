//
//  Step2.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step2: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Maträtt, ljud, kö och väder påverkar mängden mat som kommer slängas!")
            HStack {
                Spacer()
                ForwardButton(action: {navigation.next()})
            }
        }
    }
}

struct Step2_Previews: PreviewProvider {
    static var previews: some View {
        Step2()
    }
}
