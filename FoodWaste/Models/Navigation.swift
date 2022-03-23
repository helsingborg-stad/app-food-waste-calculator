//
//  Navigation.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import Foundation
import SwiftUI

protocol NavigationModel: ObservableObject {
    var step: Int {get set}
    func next()
    func previous()
    func reset()
    func getCurrentStep(views: [AnyView]) -> AnyView
}

class Navigation: NavigationModel  {
    @Published var step = 0
    
    func next() {
        step += 1
    }

    func previous() {
        step -= 1
    }

    func reset() {
        step = 0
    }

    func getCurrentStep(views: [AnyView]) -> AnyView {
        let indexExist = views.indices.contains(step)
        return indexExist ? views[step] : AnyView(EmptyView())
    }
}
