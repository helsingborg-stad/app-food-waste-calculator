//
//  Navigation.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import Foundation

class Navigation: ObservableObject {
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
}
