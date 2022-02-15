//
//  AnimationResultView.swift
//  ArithmeticAce2
//
//  Created by Winston Wang on 2022-02-15.
//

import SwiftUI

struct AnimationResultView: View {
    //MARK: Stored properties
    let answerCorrect: Bool
    let answerChecked: Bool
    
    
    var body: some View {
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
}


struct AnimationResultView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationResultView(answerCorrect: true, answerChecked: false)
    }
}
