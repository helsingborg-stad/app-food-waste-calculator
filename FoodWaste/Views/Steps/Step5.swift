//
//  Step5.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-24.
//

import SwiftUI

struct Step5: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("tabletOn")
                    .resizable()
                Image("calculatorBackground")
                    .resizable()
                    .padding()
                CalculatorView()
                    .padding([.horizontal, .vertical], 35)
            }
            .aspectRatio(0.75, contentMode: .fit)
            .frame(width: geo.size.height * 0.75, height: geo.size.height * 0.75)
            .offset(x: geo.size.width * 0.462, y: geo.size.height * 0.17)
        }
    }
}

struct Step5_Previews: PreviewProvider {
    static var previews: some View {
        Step5()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
