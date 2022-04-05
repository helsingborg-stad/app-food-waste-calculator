//
//  BackgroundView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        ZStack {
            Color.clear.overlay(
                Image("background")
                    .resizable()
                    .scaledToFill()
            )
            .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    if navigation.step > 0 {
                        ResetButton(action: { navigation.reset() })
                            .offset(x: -70, y: 15)
                    }
                }
                Spacer()
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation())
    }
}
