//
//  GameView.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var presenter:MathGamePresenter
    
    @State var currentAnswer:String = "0"
    
    func answerQuestion () {
        let answerNum = Int(currentAnswer) ?? 0
        presenter.submitAnswer(answer: answerNum)
    }
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
            VStack (spacing: 30) {
                
                Text("Current Score: \(self.presenter.currentScore)")
                Text("Round: \(self.presenter.currentQuestion) / \(self.presenter.questions.count)")
                
                Text(self.presenter.questions[self.presenter.currentQuestion].questionText)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                TextField("Your Answer", text: $currentAnswer)
                    .keyboardType(.numberPad)
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height: 50)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button(action: {
                    self.answerQuestion()
                }) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                        .foregroundColor(Color.white)
                }
                
                Spacer()
            }.foregroundColor(Color.black)
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(presenter: MathGamePresenter())
    }
}
