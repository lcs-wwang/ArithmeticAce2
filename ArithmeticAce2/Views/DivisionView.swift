//
//  DivisionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-08.
//

import SwiftUI

struct DivisionView: View {
    
    // MARK: Stored properties
    @State var divisor = Int.random(in: 1...12)
    @State var correctQuotient = Int.random(in: 1...12)
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the dividend, based on the randomly generated divisor and quotient?
    var dividend: Int {
        return correctQuotient * divisor
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack{
                QuestionPresentationView(operation: "÷", firstValue: dividend, secondValue: divisor)
            }
            
            Divider()
            
            HStack {
                ZStack{
                    AnswerAndResultView(answerChecked: answerChecked,
                                        answerCorrect: answerCorrect,
                                        inputGiven: $inputGiven)
                }
            }
            ZStack {
                
               ButtonView(correctAnswer: correctQuotient, answerChecked: $answerChecked, answerCorrect: $answerCorrect, inputGiven: inputGiven)
                
                Button(action: {
                    // Generate a new question
                    divisor = Int.random(in: 1...12)
                    correctQuotient = Int.random(in: 1...12)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
            ZStack{
                AnimationResultView(answerCorrect: answerCorrect,
                                    answerChecked: answerChecked)
            
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
        
    }
}

struct DivisionView_Previews: PreviewProvider {
    static var previews: some View {
        DivisionView()
    }
}
