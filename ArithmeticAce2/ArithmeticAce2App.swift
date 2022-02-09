//
//  ArithmeticAce2App.swift
//  ArithmeticAce2
//
//  Created by Winston Wang on 2022-02-08.
//

import SwiftUI
import Lottie

@main
struct ArithmeticAce2App: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                AdditionView()
                    .tabItem{
                        Image(systemName: "plus.circle")
                        Text("Additon")
                    }
                
                SubtractionView()
                    .tabItem{
                        Image(systemName: "minus.circle")
                        Text("subtraction")
                    }
                
                ContentView()
                    .tabItem{
                        Image(systemName: "multiply.circle")
                        Text("multiply")
                    }
                
                DivisionView()
                    .tabItem{
                        Image(systemName: "divide.circle")
                        Text("devide")
                    }
            }
        }
    }
}
