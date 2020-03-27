//
//  ContentView.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var presenter:MathGamePresenter = MathGamePresenter()
    @State var gameState:GameState = .setup
    @State var option:Int = 0
    
    var body: some View {
        
        switch (self.gameState) {
        case .setup:
            return AnyView(SetupView())
        case .playing:
            return AnyView(PlayingView())
        case .gameOver:
            return AnyView(GameOverView())
        }
        
    }
}

struct SetupView: View {
    var body: some View {
        Text("Setup Game").onTapGesture {
            print ("hi")
        }
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
