//
//  Part.swift
//  jeuPendu
//
//  Created by Benjamin Gouguet on 14/03/2019.
//  Copyright © 2019 Benjamin GOUGUET. All rights reserved.
//

import Foundation

class Part {
    
    // MARK: - Properties
    var games = [Game()]
    
    var currentGame: Game {
        return games.last!
    }
    
    var score: Int {
        return getScore()
    }
    
    var bestScore: Int {
        get {
            return UserDefaults.standard.integer(forKey: "bestScore")
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: "bestScore")
        }
    }
    
    var isOver: Bool {
        return getIsOver()
    }
    
    // MARK: - Methods
    func playerPlayed(whithLetter letter: Character) {
        if !isOver {
            currentGame.playerPlays(withLetter: letter)
        }
    }
    
    func addNewGame() {
        games.append(Game())
    }
    
    private func getScore() -> Int {
        var scores = 0
        
        for game in games {
            if game.won == true {
                scores += 1
            } else if game.won == false {
                scores = 0
            }
        }
        
        if scores > bestScore {
            bestScore = scores
        }
        
        return scores
    }
    
    private func getIsOver() -> Bool {
        for game in games {
            if game.won == false {
                return true
            }
        }
        return false
    }
    
}
