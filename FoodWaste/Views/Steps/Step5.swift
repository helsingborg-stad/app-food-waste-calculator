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
                    .frame(maxWidth: 370, maxHeight: 600)
            }
            .frame(width: 450, height: 600)
            .offset(x: geo.size.width * 0.52, y: geo.size.height * 0.17)
        }
    }
}

struct Step5_Previews: PreviewProvider {
    static var previews: some View {
        Step5()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
