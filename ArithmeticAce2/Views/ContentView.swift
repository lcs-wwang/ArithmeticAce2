//
//  ContentView.swift
//  ArithmeticAce2
//
//  Created by Winston Wang on 2022-02-08.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack{
                
                QuestionPresentationView(operation: "✕", firstValue: multiplicand, secondValue: multiplier)
            }
            
            Divider()
            
            HStack {
                ZStack{
                    AnswerAndResultView(answerChecked: answerChecked,
                                        answerCorrect: answerCorrect,
                                        inputGiven: $inputGiven)
                }
            }
            
            ZStack{
                ButtonView(correctAnswer: correctProduct, answerChecked: $answerChecked, answerCorrect: $answerCorrect, inputGiven: inputGiven)
                
                Button(action: {
                    multiplicand = Int.random(in: 1...12)
                    multiplier = Int.random(in: 1...12)
                    answerChecked = false
                    answerCorrect = false
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                //Only show this button when an answer has been check
                    .opacity(answerChecked ? 1.0 : 0.0)
            }
            ZStack{
                AnimationResultView(answerCorrect: answerCorrect, answerChecked: answerChecked)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
