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
            return AnyView(GameView(presenter: self.presenter))
        case .gameOver:
            return AnyView(GameOverView())
        }
        
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
