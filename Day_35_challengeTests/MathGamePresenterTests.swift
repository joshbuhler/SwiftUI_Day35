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
        
        presenter.startGame(totalQuestions: 3, upperRange: 5)
        
        XCTAssertNotEqual(presenter.gameState, .setup)
        XCTAssertFalse(presenter.questions.count == 0)
        
        presenter.newGame()
        
        XCTAssertEqual(presenter.gameState, .setup)
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertTrue(presenter.questions.count == 0)
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
    
    func submitAnswer () {
        
    }

}
