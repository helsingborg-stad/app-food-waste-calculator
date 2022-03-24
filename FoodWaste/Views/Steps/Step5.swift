//
//  Step5.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-24.
//

import SwiftUI

struct Step5: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Step 5")
            ResetButton(action: { navigation.reset() })
        }
    }
}

struct Step5_Previews: PreviewProvider {
    static var previews: some View {
        Step4()
    }
}
