//
//  MathGamePresenterTests.swift
//  Day_35_challengeTests
//
//  Created by Joshua Buhler on 3/26/20.
//  Copyright © 2020 jb. All rights reserved.
//

import XCTest
@testable import Day_35_challenge

class MathGamePresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_newGame () {
        let presenter = MathGamePresenter()
        
        presenter.newGame()
        
        XCTAssertEqual(presenter.gameState, .setup)
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertTrue(presenter.questions.count == 0)
        XCTAssertEqual(presenter.currentQuestion, 0)
        
        presenter.startGame(totalQuestions: 3, upperRange: 5)
        
        XCTAssertNotEqual(presenter.gameState, .setup)
        XCTAssertFalse(presenter.questions.count == 0)
        
        presenter.newGame()
        
        XCTAssertEqual(presenter.gameState, .setup)
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertTrue(presenter.questions.count == 0)
        XCTAssertEqual(presenter.currentQuestion, 0)
    }
    
    func test_triangleNumber () {
        let presenter = MathGamePresenter()
        
        XCTAssertEqual(presenter.triangleNumber(5), 15)
        XCTAssertEqual(presenter.triangleNumber(4), 10)
        XCTAssertEqual(presenter.triangleNumber(3), 6)
        XCTAssertEqual(presenter.triangleNumber(2), 3)
        XCTAssertEqual(presenter.triangleNumber(7), 28)
    }
    
    func test_startGame_allPossible () {
        let presenter = MathGamePresenter()
        
        let questionCount = 0
        let upperRange = 4
        let lowerRange = 0
        
        // Question count of 0 is special = this gives us all possible answers.
        // 5x5, 5x4, 5x3...0x0
        // End result is a triangle number (kinda like a factorial, but with addition)
        // of the upper range for the total number of questions
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange)
        
        XCTAssertEqual(presenter.gameState, .playing)
        // Adding 1 here because of how many unique digits we're using. (0, 1, 2, 3, 4) == 5
        let expectedCount = presenter.triangleNumber((upperRange - lowerRange) + 1)
        XCTAssertTrue(presenter.questions.count == expectedCount, "Got: \(presenter.questions.count) Expected: \(expectedCount)")
        for q in presenter.questions {
            XCTAssertLessThanOrEqual(q.leftSide, upperRange)
            XCTAssertLessThanOrEqual(q.rightSide, upperRange)
            
            XCTAssertGreaterThanOrEqual(q.leftSide, lowerRange)
            XCTAssertGreaterThanOrEqual(q.rightSide, lowerRange)
            print("q: \(q.questionText)")
        }
    }
    
    func test_startGame_allPossible_smallerRange () {
        let presenter = MathGamePresenter()
        
        let questionCount = 0
        let upperRange = 4
        let lowerRange = 3
        
        // Question count of 0 is special = this gives us all possible answers.
        // 5x5, 5x4, 5x3...0x0
        // End result is a triangle number (kinda like a factorial, but with addition)
        // of the upper range for the total number of questions
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange,
                            lowerRange: lowerRange)
        
        XCTAssertEqual(presenter.gameState, .playing)
        // Adding 1 here because of how many unique digits we're using. (0, 1, 2, 3, 4) == 5
        let expectedCount = presenter.triangleNumber((upperRange - lowerRange) + 1)
        XCTAssertTrue(presenter.questions.count == expectedCount, "Got: \(presenter.questions.count) Expected: \(expectedCount)")
        for q in presenter.questions {
            XCTAssertLessThanOrEqual(q.leftSide, upperRange)
            XCTAssertLessThanOrEqual(q.rightSide, upperRange)
            
            XCTAssertGreaterThanOrEqual(q.leftSide, lowerRange)
            XCTAssertGreaterThanOrEqual(q.rightSide, lowerRange)
            print("q: \(q.questionText)")
        }
    }
    
    func test_startGame_defaultLowerRange () {
        let presenter = MathGamePresenter()
        
        let questionCount = 5
        let upperRange = 5
        let lowerRange = 0
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange)
        
        XCTAssertEqual(presenter.gameState, .playing)
        XCTAssertTrue(presenter.questions.count == questionCount)
        for q in presenter.questions {
            XCTAssertLessThanOrEqual(q.leftSide, upperRange)
            XCTAssertLessThanOrEqual(q.rightSide, upperRange)
            
            XCTAssertGreaterThanOrEqual(q.leftSide, lowerRange)
            XCTAssertGreaterThanOrEqual(q.rightSide, lowerRange)
            print("q: \(q.questionText)")
        }
    }
    
    func test_startGame_withLowerRange () {
        let presenter = MathGamePresenter()
        
        let questionCount = 10
        let upperRange = 7
        let lowerRange = 5
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange,
                            lowerRange: lowerRange)
        
        XCTAssertEqual(presenter.gameState, .playing)
        XCTAssertTrue(presenter.questions.count == questionCount)
        for q in presenter.questions {
            XCTAssertLessThanOrEqual(q.leftSide, upperRange)
            XCTAssertLessThanOrEqual(q.rightSide, upperRange)
            
            XCTAssertGreaterThanOrEqual(q.leftSide, lowerRange)
            XCTAssertGreaterThanOrEqual(q.rightSide, lowerRange)
            print("q: \(q.questionText)")
        }
    }
    
    func test_submitAnswer_allCorrect () {
        let presenter = MathGamePresenter()
        
        let questionCount = 5
        let upperRange = 5
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange)
        
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertEqual(presenter.currentQuestion, 0)
        
        var expectedScore = 1
        var expectedQuestion = 1
        
        XCTAssertEqual(presenter.gameState, GameState.playing)
        
        for q in presenter.questions {
            
            presenter.submitAnswer(answer: q.correctAnswer)
            
            XCTAssertEqual(presenter.currentScore, expectedScore)
            XCTAssertEqual(presenter.currentQuestion, expectedQuestion)
            
            expectedScore += 1
            expectedQuestion += 1
        }
        
        XCTAssertEqual(presenter.gameState, GameState.gameOver)
    }
    
    func test_submitAnswer_someCorrect () {
        let presenter = MathGamePresenter()
        
        let questionCount = 5
        let upperRange = 5
        presenter.startGame(totalQuestions: questionCount,
                            upperRange: upperRange)
        
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertEqual(presenter.currentQuestion, 0)
        
        var q = presenter.questions[presenter.currentQuestion]
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentScore, 1)
        XCTAssertEqual(presenter.currentQuestion, 1)
        XCTAssertEqual(presenter.gameState, GameState.playing)
        
        q = presenter.questions[presenter.currentQuestion]
        presenter.submitAnswer(answer: q.correctAnswer + 1)
        XCTAssertEqual(presenter.currentScore, 1)
        XCTAssertEqual(presenter.currentQuestion, 2)
        XCTAssertEqual(presenter.gameState, GameState.playing)
        
        q = presenter.questions[presenter.currentQuestion]
        presenter.submitAnswer(answer: q.correctAnswer + 1)
        XCTAssertEqual(presenter.currentScore, 1)
        XCTAssertEqual(presenter.currentQuestion, 3)
        XCTAssertEqual(presenter.gameState, GameState.playing)
        
        q = presenter.questions[presenter.currentQuestion]
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentScore, 2)
        XCTAssertEqual(presenter.currentQuestion, 4)
        
        q = presenter.questions[presenter.currentQuestion]
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentScore, 3)
        XCTAssertEqual(presenter.currentQuestion, 5)
        
        XCTAssertEqual(presenter.gameState, GameState.gameOver)
        
        // try submitting another answer after game over - score shouldn't change
        XCTAssertEqual(presenter.currentQuestion, presenter.questions.count)
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentQuestion, presenter.questions.count)
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentQuestion, presenter.questions.count)
        presenter.submitAnswer(answer: q.correctAnswer)
        XCTAssertEqual(presenter.currentScore, 3)
        XCTAssertEqual(presenter.currentQuestion, 5)
    }

}
