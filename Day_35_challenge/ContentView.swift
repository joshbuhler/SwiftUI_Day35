//
//  ContentView.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var presenter:MathGamePresenter = MathGamePresenter()
    @State var option:Int = 0
    
    var body: some View {
        
        switch (self.presenter.gameState) {
        case .setup:
            return AnyView(SetupView(presenter: self.presenter))
        case .playing:
            return AnyView(PlayingView())
        case .gameOver:
            return AnyView(GameOverView())
        }
        
    }
}

struct SetupView: View {
    
    var presenter:MathGamePresenter
    
    @State private var lowerBound:Int = 0
    @State private var upperBound:Int = 5
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 40) {
                Text("MATH FACTS")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text("Set the game range:")
                
                HStack {
                    VStack {
                        Text("Lowest Number: \(self.lowerBound)")
                        Stepper("", value: $lowerBound, in: 0...12)
                        .labelsHidden()
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .center) {
                        Text("Highest Number: \(self.upperBound)")
                        Stepper("", value: $upperBound, in: 0...12)
                            .labelsHidden()
                    }
                }.padding()
                
                
                
                Spacer ()
            }
            
            
        }.foregroundColor(Color.white)
        
        
//        Text("Setup Game").onTapGesture {
//            print ("hi")
//            self.presenter.startGame(totalQuestions: 5, upperRange: 4)
//        }
    }
}

struct PlayingView: View {
    var body: some View {
        Text("Playing Game")
    }
}

struct GameOverView: View {
    var body: some View {
        Text("Game Over")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
