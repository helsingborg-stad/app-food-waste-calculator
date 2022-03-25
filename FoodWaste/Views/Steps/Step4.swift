//
//  Step4.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import SwiftUI

struct Step4: View {
    var body: some View {
        GeometryReader { geo in
            TabletView()
                .frame(width: 450, height: 600)
                .offset(x: geo.size.width * 0.52, y: geo.size.height * 0.17)
        }
    }
}

struct Step4_Previews: PreviewProvider {
    static var previews: some View {
        Step4()
            .previewInterfaceOrientation(.landscapeLeft).environmentObject(Navigation())
    }
}
