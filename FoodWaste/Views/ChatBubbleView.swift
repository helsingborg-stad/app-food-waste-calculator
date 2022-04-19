//
//  SwiftUIView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-17.
//

import SwiftUI

enum ChatBubbleArrow {
    case left, right
}

struct ChatBubbleView<Content: View>: View {
    var arrowDirection: ChatBubbleArrow
    var content: Content

    init(content: Content, arrowDirection: ChatBubbleArrow) {
        self.content = content
        self.arrowDirection = arrowDirection
    }

    init(content: Content) {
        self.content = content
        self.arrowDirection = .left
    }

    var body: some View {
        VStack(alignment: .leading) {
            self.content
        }
        .padding(30)
        .padding(.bottom, 25)
        .background(Color("ChatBubbleColor"))
        .clipShape(Bubble(arrowDirection: arrowDirection))
        .frame(maxWidth: 530)
    }
}

struct Bubble: Shape {
    var arrowDirection: ChatBubbleArrow = .left

    func path(in rect: CGRect) -> Path {
        switch arrowDirection {
        case .left: return bubbleLeftPath(rect: rect)
        case .right: return bubbleRightPath(rect: rect)
        }
    }
}

func bubbleLeftPath(rect: CGRect) -> Path {
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

func bubbleRightPath(rect: CGRect) -> Path {
    let width = rect.width
    let height = rect.height
    let path = UIBezierPath()
    path.move(to: CGPoint(x: width-60, y: height-30))
    path.addLine(to: CGPoint(x: width-60, y: height))
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
    return Path(path.cgPath)
}

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChatBubbleView(
                content:
                Text("Hej, vill du hjälpa mig att\nplanera skolmaten? \n\nVi vill akta oss för matsvinn!")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
            )

            ChatBubbleView(
                content:
                Text("Yo!")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
            )

            ChatBubbleView(
                content:
                Text("Arrow right")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white),
                arrowDirection: ChatBubbleArrow.right
            )
        }
    }
}
