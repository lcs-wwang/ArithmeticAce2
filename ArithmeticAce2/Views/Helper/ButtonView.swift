//
//  ButtonView.swift
//  ArithmeticAce2
//
//  Created by Winston Wang on 2022-02-15.
//

import SwiftUI

struct ButtonView: View {
    //MARK: stored properties
    let correctAnswer: Int
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    let inputGiven: String
    
    //MARK: computed properties

    
    var body: some View {
        ZStack {
            Button(action: {
                answerChecked = true
                guard let answerGiven = Int(inputGiven) else {
                    answerCorrect = false
                    return
                }
                if  answerGiven == correctAnswer {
                    answerCorrect = true
                } else {
                    answerCorrect = false
                }
            }, label: {
                Text("Check Answer")
                    .font(.largeTitle)
            })
                .padding()
                .buttonStyle(.bordered)
                .opacity(answerChecked == false ? 1.0 : 0.0)
        }
    }
}


