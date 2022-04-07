//
//  ButtonViews.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import SwiftUI

struct ResetButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image("back")
        }
    }
}

struct ForwardButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image("forward")
        }
    }
}

struct LanguageButton: View {
    var text: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack {
                Circle()
                    .fill(Color("BackgroundColor"))
                    .shadow(color: Color(white: 0.3), radius: 2, x: 0, y: 1)
                Text(text)
                    .font(.system(size: 45.0))
            }.frame(width: 65, height: 65)
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            LanguageButton(text: "🇸🇪", action: { print("CLicked") })
            ResetButton(action: { print("Clicked") })
            ForwardButton(action: { print("Clicked") })
        }
    }
}
