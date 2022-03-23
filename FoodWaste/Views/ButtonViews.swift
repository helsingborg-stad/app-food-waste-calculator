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

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton(action: { print("Clicked") })
        ForwardButton(action: { print("Clicked") })
    }
}
