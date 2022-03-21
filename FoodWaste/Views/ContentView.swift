//
//  ContentView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            ChatBubbleView(content: "Hej, vill du hjälpa mig att\nplanera skolmaten? \n\nVi vill akta oss för matsvinn!")
                .offset(x: 130, y: -60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
