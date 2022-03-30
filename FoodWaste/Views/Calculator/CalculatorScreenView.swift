//
//  CalculatorScreenView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-29.
//

import SwiftUI

struct CalculatorScreenView: View {
    var body: some View {
        ZStack {}
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color("CalculatorFaceColor"))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("CalculatorFaceShadowColor"), lineWidth: 2)
                .shadow(color: .black, radius: 3, x: 5, y: 5)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        )
    }
}

struct CalculatorScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreenView()
    }
}
