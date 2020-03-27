//
//  GameOverView.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    
    var presenter:MathGamePresenter
        
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .top,
                           endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
            VStack (spacing: 30) {
                
                Text("Final Score: \(self.presenter.currentScore)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                
                Text("Total Questions: \(presenter.questions.count)")
                    .foregroundColor(Color.white)
                
                Button(action: {
                    self.presenter.newGame()
                }) {
                    Image(systemName: "leaf.arrow.circlepath")
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
    
    
    struct GameOverView_Previews: PreviewProvider {
        static var previews: some View {
            GameOverView(presenter: MathGamePresenter())
        }
    }
}
