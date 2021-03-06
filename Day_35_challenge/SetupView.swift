//
//  SetupView.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    var presenter:MathGamePresenter
    
    @State private var lowerBound:Int = 0
    @State private var upperBound:Int = 5
    @State private var totalRounds:Int = 0
    
    var roundOptions:[String] = ["5", "10", "20", "All"]
    
    func startGame () {
        let rounds:Int = Int(roundOptions[totalRounds]) ?? 0
        
        presenter.startGame(totalQuestions: rounds,
                            upperRange: upperBound,
                            lowerRange: lowerBound)
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 30) {
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
                }
                
                Picker("Total Rounds", selection: $totalRounds) {
                    ForEach (0 ..< roundOptions.count) {
                        Text("\(self.roundOptions[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    self.startGame()
                }) {
                    Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
                    .foregroundColor(Color.white)
                }
                
                Spacer ()
            }.padding()
            
            
        }.foregroundColor(Color.white)
    }
}
