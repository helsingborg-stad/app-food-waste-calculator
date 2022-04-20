//
//  FaceView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-29.
//

import SwiftUI

enum FaceStatus: String, Identifiable {
    case angry, disappointed, happy, neutral, thinking
    var id: Self { self }
    
    var color: String {
        switch self {
        case .neutral, .thinking:
            return "ColorBlue"
        case .disappointed:
            return "ColorYellow"
        case .angry:
            return "ColorRed"
        case .happy:
            return "ColorGreen"
        }
    }
    
    var mouthControlPoint: Double {
        switch self {
        case .neutral, .thinking, .happy:
            return 15
        case .disappointed:
            return -15
        case .angry:
            return -25
        }
    }
    
    var eyeControlPoints: [Double] {
        switch self {
        case .neutral, .thinking, .happy:
            return [0.43,0.43]
        case .disappointed:
            return [0,0]
        case .angry:
            return [0,0.43]
        }
    }
    
    var next: FaceStatus {
        switch self {
        case .neutral:
            return .thinking
        case .thinking:
            return .disappointed
        case .disappointed:
            return .angry
        case .angry:
            return .happy
        case .happy:
            return .neutral
        }
    }
}

struct FaceView: View {
    var status: FaceStatus
    
    var body: some View {
        VStack(spacing: 4) {
            Spacer()
            HStack() {
                EyeShape(topCurve: status.eyeControlPoints[0], bottomCurve: status.eyeControlPoints[1])
                    .fill(Color(status.color))
                    .frame(width: 22, height: 22)
                    .overlay(
                        status == .thinking ? SpinningSpiral().frame(width: 27, height: 27) : nil
                        ,alignment: .center)
                Spacer()
                EyeShape(topCurve: status.eyeControlPoints[0], bottomCurve: status.eyeControlPoints[1])
                    .fill(Color(status.color))
                    .frame(width: 22, height: 22)
                    .overlay(
                        status == .thinking ? SpinningSpiral().frame(width: 27, height: 27) : nil
                        ,alignment: .center)
            }
            .frame(height: 30)
            MouthShape(controlPoint: status.mouthControlPoint)
                .fill(Color(status.color))
                .frame(width: 35, height: 15)
            Spacer()
        }
        .frame(width: 100, height: 70)
    }
}

struct MouthShape: Shape {
    var controlPoint: Double
    
    var animatableData: Double {
        get { controlPoint  }
        set { controlPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 0),
                          controlPoint: CGPoint(x: width/2, y: controlPoint))
        path.addQuadCurve(to: CGPoint(x: 0, y: 0),
                          controlPoint: CGPoint(x: width/2, y: controlPoint+10))
        return Path(path.cgPath)
    }
}

struct EyeShape: Shape {
    var topCurve: Double
    var bottomCurve: Double
    var defaultCurve: Double = 0.43
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(topCurve), Double(bottomCurve)) }
        set {
            topCurve = Double(newValue.first)
            bottomCurve = Double(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 0),
                          controlPoint: CGPoint(x: width/2, y: -(topCurve * width)))
        path.addQuadCurve(to: CGPoint(x: width, y: height),
                          controlPoint: CGPoint(x: width + (defaultCurve * width), y: height/2))
        path.addQuadCurve(to: CGPoint(x: 0, y: height),
                          controlPoint: CGPoint(x: width/2, y: height+(bottomCurve * height)))
        path.addQuadCurve(to: CGPoint(x: 0, y: 0),
                          controlPoint: CGPoint(x: -(defaultCurve * width), y: height/2))
        return Path(path.cgPath)
    }
}

struct SpinningSpiral : View {
    @State var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0).repeatForever(autoreverses: false)
    }
    var body: some View {
        Image("spiral")
            .resizable()
            .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
            .onAppear {
                withAnimation(foreverAnimation) {
                    self.isAnimating = true
                }
            }
    }
}

struct FacePreview: View {
    var body: some View {
        VStack {
            FaceView(status: FaceStatus.neutral)
            FaceView(status: FaceStatus.thinking)
            FaceView(status: FaceStatus.happy)
            FaceView(status: FaceStatus.disappointed)
            FaceView(status: FaceStatus.angry)
            ZStack{
                CalculatorScreenView()
                HStack(spacing: 40){
                    FaceView(status: FaceStatus.neutral)
                }
            }
        }
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FacePreview()
        }
    }
}
