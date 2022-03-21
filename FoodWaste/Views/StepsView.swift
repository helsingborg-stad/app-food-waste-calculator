//
//  StepsView.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-03-18.
//

import SwiftUI

func CreateStepView(step: Int) -> some View {
    let StepViewsList: [AnyView] = [
        AnyView(Step1()),
        AnyView(Step2()),
        AnyView(Step3())
    ]
    let indexExist = StepViewsList.indices.contains(step)
    
    return indexExist ? StepViewsList[step] : AnyView(EmptyView())
}

struct Step1: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Hej, vill du hjälpa mig att\nplanera skolmaten? \n\nVi vill akta oss för matsvinn!")
            HStack {
                Spacer()
                ForwardButton(action: {navigation.next()})
            }
        }.offset(x: 130, y: -60)
    }
}

struct Step2: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Maträtt, ljud, kö och väder påverkar mängden mat som kommer slängas!")
            HStack {
                Spacer()
                ForwardButton(action: {navigation.next()})
            }
        }
    }
}

struct Step3: View {
    @EnvironmentObject var navigation: Navigation
    var body: some View {
        ChatBubbleView {
            ChatBubbleText(text: "Step 3")
            ResetButton(action: { navigation.reset() })
        }
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        Step1()
        Step2()
        Step3()
    }
}
