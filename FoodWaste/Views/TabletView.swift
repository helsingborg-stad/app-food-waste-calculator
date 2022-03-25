//
//  TabletView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-21.
//

import SwiftUI

struct TabletView: View {
    @EnvironmentObject var navigation: Navigation
    @State var isTabletOn = false
    
    var body: some View {
        ZStack {
            if !isTabletOn {
                Image("tabletOff")
                    .resizable()
                    .transition(.opacity)
                    .zIndex(1)
            } else {
                Image("tabletBg")
                    .resizable()
                    .transition(.opacity)
                    .zIndex(1)
                GeometryReader { geo in
                    VStack(alignment: .center, spacing: geo.size.height * 0.08) {
                        Image("calculator")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.height * 0.40)
                        
                        Button(action: {
                            navigation.next()
                        }) {
                            Image("startButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.height * 0.40)
                        }

                        Image("hbg")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.height * 0.10)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
                .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            Image("tabletOn")
                .resizable()
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).delay(0.5)) {
                self.isTabletOn = true
            }
        }
    }
}

struct TabletView_Previews: PreviewProvider {
    static var previews: some View {
        TabletView()
    }
}
