//
//  MathGamePresenter.swift
//  Day_35_challenge
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import Foundation

class MathGamePresenter {
    
    private(set) public var gameState:GameState = .setup
    private(set) public var currentScore:Int = 0
    
    private(set) public var questions:[MathQuestion] = [MathQuestion]()
    
    func newGame () {
        gameState = .setup
        currentScore = 0
        questions = [MathQuestion]()
    }
    
    func startGame (totalQuestions:Int, upperRange:Int, lowerRange:Int = 0) {
        currentScore = 31
        gameState = .playing
        questions.append(MathQuestion(leftSide: 3, rightSide: 3))
    }
    
    func submitAnswer (answer:Int) {
        
    }
    
}

enum GameState {
    case setup
    case playing
    case over
}

struct MathQuestion {
    var leftSide:Int
    var rightSide:Int
    
    var questionText:String {
        get {
            return "What is \(leftSide) x \(rightSide)?"
        }
    }
}
