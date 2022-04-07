//
//  FoodWasteApp.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import SwiftUI

@main
struct FoodWasteApp: App {
    @StateObject var navigation = Navigation()
    @StateObject var gameObserver = GameObserver()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigation)
                .environmentObject(gameObserver)
        }
    }
}
