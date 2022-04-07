//
//  KeyboardWastParamView.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-18.
//

import SwiftUI

struct KeyboardWastParamsView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @ViewBuilder
    private func getButtonGroup(wasteParameters: [WasteParameter]) -> some View {
        Group {
            ForEach (wasteParameters) { waste in
                RoundedWasteButton(waste: waste)
            }
        }
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 7) {
            getButtonGroup(wasteParameters: [.burger, .gazpacho, .fish])
            getButtonGroup(wasteParameters: [.soundLow, .soundModerate, .soundHigh])
            getButtonGroup(wasteParameters: [.queueShort, .queueModerate, .queueLong])
            getButtonGroup(wasteParameters: [.clouds, .sun, .rain])
        }
    }
}

struct KeyboardWastParamView_Previews: PreviewProvider {   
    static var previews: some View {
        KeyboardWastParamsView()
    }
}
