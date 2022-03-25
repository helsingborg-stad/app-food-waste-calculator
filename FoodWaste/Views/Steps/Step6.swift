//
//  Step6.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-25.
//

import SwiftUI

struct Step6: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ResetButton(action: { navigation.reset() })
        }
    }
}

struct Step6_Previews: PreviewProvider {
    static var previews: some View {
        Step6()
    }
}
