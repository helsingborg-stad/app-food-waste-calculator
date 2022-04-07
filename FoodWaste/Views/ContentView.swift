//
//  ContentView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        ZStack {
            BackgroundView()
            navigation.getCurrentStep(views: StepsList)
        }
    }
    
    let StepsList: [AnyView] = [
        AnyView(Step1()),
        AnyView(Step2()),
        AnyView(Step3()),
        AnyView(Step4()),
        AnyView(Step5()),
        AnyView(Step6()),
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
