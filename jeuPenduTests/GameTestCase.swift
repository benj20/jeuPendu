//
//  GameTestCase.swift
//  jeuPenduTests
//
//  Created by Benjamin Gouguet on 12/03/2019.
//  Copyright © 2019 Benjamin GOUGUET. All rights reserved.
//

import XCTest
@testable import jeuPendu

class GameTestCase: XCTestCase {
    
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    func testGivenWordOfViewIsEmpty_WhenNewGame_ThenWordOfViewCountEqualWordCount() {
        XCTAssertEqual(game.wordOfView.count, game.word.count)
    }
    
    func testGivenWordIsNotFound_WhenNewGame_ThenWordIsNotFound() {
        XCTAssertFalse(game.wordFound)
    }
    
    func testGivenPlayerIsToOneLetterOfToWin_WhenPlayerPlaysGoodLetter_ThenPlayerWinAndGameIsOver() {
        game.wordOfView = game.word
        let letter = game.wordOfView[game.wordOfView.count - 1]
        game.wordOfView[game.wordOfView.count - 1] = "-"
        
        game.playerPlays(withLetter: letter)
        
        XCTAssertEqual(game.won, true)
        XCTAssertTrue(game.isOver)
    }
    
    func testGivenThePlayerIsAtOneStrokeOfLosing_WhenPlayerPlaysWrongLetter_ThenPlayerLoseAndGameIsOver() {
        let letter: Character = "1"
        game.scoreOfTheWord = 1
        
        game.playerPlays(withLetter: letter)
        
        XCTAssertEqual(game.scoreOfTheWord, 0)
        XCTAssertEqual(game.won, false)
        XCTAssertTrue(game.isOver)
    }
    
}
