//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-08.
//

import SwiftUI

struct AdditionView: View {
    
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...143)
    @State var addend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack{
                
                QuestionPresentationView(operation: "+", firstValue: augend, secondValue: addend)
            }
            
            Divider()
            HStack{
                ZStack{
                    AnswerAndResultView(answerChecked: answerChecked,
                                        answerCorrect: answerCorrect,
                                        inputGiven: $inputGiven)
                }
            }
            ZStack {
                Button(action: {
                    answerChecked = true
                    guard let sumGiven = Int(inputGiven) else {
                        answerCorrect = false
                        return
                    }
                    if sumGiven == correctSum {
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
                
                
                
                Button(action: {
                    
                    augend = Int.random(in: 1...143)
                    addend = Int.random(in: 1...144 - augend)
                    
                    answerChecked = false
                    answerCorrect = false
                    
                    inputGiven = ""
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                
                    .opacity(answerChecked == true ? 1.0 : 0.0)
                
            }
            
            // Reaction animation
            ZStack {
                LottieView(animationNamed: "80312-happy-to-update")
                    .opacity(answerCorrect == true ? 1.0 : 0.0)
                    .padding()
                
                LottieView(animationNamed: "55385-worried")
                    .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                    .padding()
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        //A block of code that runs once the view structure has been created
        .task {
            addend = Int.random(in: 1...144 - augend)
        }
        
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
