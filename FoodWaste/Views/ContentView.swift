//
//  ContentView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigation = Navigation()
    
    var body: some View {
        ZStack {
            BackgroundView()
            navigation.getCurrentStep(views: StepsList)
        }
        .environmentObject(navigation)
    }
}

let StepsList: [AnyView] = [
    AnyView(Step1()),
    AnyView(Step2()),
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
