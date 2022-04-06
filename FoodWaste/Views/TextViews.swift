//
//  TextViews.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import SwiftUI

struct ChatBubbleText: View {
    var text: LocalizedStringKey
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleText(text: "Hello world")
    }
}
