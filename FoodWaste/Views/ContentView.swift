//
//  ContentView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct ContentView: View {c
    @StateObject var navigation = Navigation()

    var body: some View {
        ZStack {
            BackgroundView()
            CreateStepView(step: navigation.step)
        }
        .environmentObject(navigation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
