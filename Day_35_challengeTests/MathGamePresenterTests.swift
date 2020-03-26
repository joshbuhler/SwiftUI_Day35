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
        XCTAssertNotEqual(presenter.currentScore, 0)
        XCTAssertFalse(presenter.questions.count == 0)
        
        presenter.newGame()
        
        XCTAssertEqual(presenter.gameState, .setup)
        XCTAssertEqual(presenter.currentScore, 0)
        XCTAssertTrue(presenter.questions.count == 0)
    }
    
    func test_startGame () {
        
    }
    
    func submitAnswer () {
        
    }

}
