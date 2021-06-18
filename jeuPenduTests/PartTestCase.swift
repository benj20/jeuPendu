//
//  PartTestCase.swift
//  jeuPenduTests
//
//  Created by Benjamin Gouguet on 14/03/2019.
//  Copyright © 2019 Benjamin GOUGUET. All rights reserved.
//

import XCTest
@testable import jeuPendu

class PartTestCase: XCTestCase {
    
    var part: Part!
    
    override func setUp() {
        super.setUp()
        part = Part()
    }
    
    func testGivenScoreIs0AndPlayerIsToOneLetterOfToWin_WhenPlayerPlaysGoodLetter_ThenScoreIs1AndPartIsNotOver() {
        part.currentGame.wordOfView = part.currentGame.word
        let letter = part.currentGame.wordOfView[part.currentGame.wordOfView.count - 1]
        part.currentGame.wordOfView[part.currentGame.wordOfView.count - 1] = "-"
        
        part.playerPlayed(whithLetter: letter)
        
        XCTAssertEqual(part.score, 1)
        XCTAssertFalse(part.isOver)
    }
    
    func testGivenPlayerIsAtOneStrokeOfLosing_WhenPlayerPlaysWrongLetter_ThenPartIsLostAndPartIsOver() {
        let letter: Character = "1"
        part.currentGame.scoreOfTheWord = 1
        
        part.playerPlayed(whithLetter: letter)
        
        XCTAssertTrue(part.isOver)
        XCTAssertEqual(part.score, 0)
    }
    
    func testGivenGamesHasOneGame_WhenAddNewGame_ThenGamesHasTwoGame() {
        part.addNewGame()
        
        XCTAssertEqual(part.games.count, 2)
    }
    
    func testGivenScoreIs0AndBestScoreIs0_WhenGameWon_ThenScoreIs1AndBestScoreIs1() {
        part.currentGame.won = true
        part.bestScore = 0
        
        XCTAssertEqual(part.score, 1)
        XCTAssertEqual(part.bestScore, 1)
    }
}
