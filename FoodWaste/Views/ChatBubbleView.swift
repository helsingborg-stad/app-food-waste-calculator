//
//  SwiftUIView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-17.
//

import SwiftUI

struct ChatBubbleView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack {
            self.content
        }
        .padding(30)
        .padding(.bottom, 25)
        .background(Color("ChatBubbleColor"))
        .clipShape(Bubble())
        .frame(maxWidth: 500)
    }
}

struct Bubble: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = UIBezierPath()

        path.move(to: CGPoint(x: 60, y: height-30))
        path.addLine(to: CGPoint(x: width-15, y: height-30))
        path.addQuadCurve(to: CGPoint(x: width, y: height-45),
                          controlPoint: CGPoint(x: width, y: height-30))
        path.addLine(to: CGPoint(x: width, y: 15))
        path.addQuadCurve(to: CGPoint(x: width-15, y: 0),
                          controlPoint: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 15, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: 15),
                          controlPoint: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height-45))
        path.addQuadCurve(to: CGPoint(x: 15, y: height-30),
                          controlPoint: CGPoint(x: 0, y: height-30))
        path.addLine(to: CGPoint(x: 15, y: height))

        return Path(path.cgPath)
    }
}

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView { Text("Hej, vill du hjälpa mig att\nplanera skolmaten? \n\nVi vill akta oss för matsvinn!")
            .bold()
            .font(.title)
            .foregroundColor(.white)
        }
        ChatBubbleView {
            Text("Yo!")
                .bold()
                .font(.title)
                .foregroundColor(.white)
        }
    }
}
