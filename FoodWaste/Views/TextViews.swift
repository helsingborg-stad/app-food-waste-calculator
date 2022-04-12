//
//  TextViews.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import SwiftUI

struct ChatBubbleText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.system(size: 33.0))
            .foregroundColor(.white)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView(content:
            ChatBubbleText(text: "Hello world")
        )
    }
}
