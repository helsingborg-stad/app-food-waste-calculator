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
        .statusBar(hidden: true)
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
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                .previewDisplayName("iPad Pro (12.9-inch)")
                .previewInterfaceOrientation(.landscapeLeft)
                .environment(\.locale, .init(identifier: "sv"))

            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air (4th generation)")
                .previewInterfaceOrientation(.landscapeLeft)

            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPad (9th generation)"))
                .previewDisplayName("iPad (9th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
        }
        .environmentObject(Navigation())
        .environmentObject(Localization())
    }
}
