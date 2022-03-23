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
        ChatBubbleView {
            ChatBubbleText(text: "Step 3")
            HStack {
                Spacer()
                ForwardButton(action: {navigation.next()})
            }
        }
    }
}

struct Step3_Previews: PreviewProvider {
    static var previews: some View {
        Step3()
    }
}
