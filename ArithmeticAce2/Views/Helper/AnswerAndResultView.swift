//
//  AnswerAndResultView.swift
//  ArithmeticAce2
//
//  Created by Winston Wang on 2022-02-14.
//

import SwiftUI

struct AnswerAndResultView: View {
    //MARK: stored properties
    //These properties are not modified in this view, so we can declare them as constancts(let)
    let answerChecked: Bool
    let answerCorrect: Bool
    
    //This property needs to be modified on the view
    //This view did not create the data
    //SO we use @Binding
    @Binding var inputGiven: String
    
    
    //MARK: computed properties
    
    var body: some View {
        ZStack {
            Image(systemName: "checkmark.circle")
                .foregroundColor(.green)
            //        CONDITION      true  false
                .opacity(answerCorrect == true ? 1.0 : 0.0)
            
            Image(systemName: "x.square")
                .foregroundColor(.red)
            //        CONDITION1         AND     CONDITION2         true  false
            //       answerChecked = true     answerCorrect = false
                .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
        }
        
        Spacer()
        
        TextField("",
                  text: $inputGiven)
            .multilineTextAlignment(.trailing)
        
    }
}

struct AnswerAndResultView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerAndResultView(answerChecked: true,
                            answerCorrect: false,
                            inputGiven: .constant("7"))
    }
}
