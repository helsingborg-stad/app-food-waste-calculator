//
//  Step4.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step4: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Step 3")
            ResetButton(action: { navigation.reset() })
        }
    }
}

struct Step4_Previews: PreviewProvider {
    static var previews: some View {
        Step4()
    }
}
