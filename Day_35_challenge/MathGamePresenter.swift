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
        
        gameState = .playing
        
        if (totalQuestions == 0) {
            // going to generate these slightly differently. 0 means that we do all possible questions
            for u in (lowerRange...upperRange).reversed() {
                for l in (lowerRange...u).reversed() {
                    let newQ = MathQuestion(leftSide: u, rightSide: l)
                    questions.append(newQ)
                }
            }
            
        } else {
            for _ in 0..<totalQuestions {
                let newQ = MathQuestion(leftSide: Int.random(in: lowerRange...upperRange),
                                        rightSide: Int.random(in: lowerRange...upperRange))
                questions.append(newQ)
            }
        }
        
        
    }
    
    func submitAnswer (answer:Int) {
        
    }
    
    func triangleNumber (_ num:Int) -> Int {
        return (num * (num + 1)) / 2
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
