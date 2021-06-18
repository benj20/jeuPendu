//
//  Game.swift
//  jeuPendu
//
//  Created by Benjamin Gouguet on 12/03/2019.
//  Copyright © 2019 Benjamin GOUGUET. All rights reserved.
//

import Foundation

class Game {
    
    // MARK: - Properties
    var word: [Character]!
    var wordOfView: [Character]!
    var scoreOfTheWord = 7
    private var drawings = [" _____\n |   |\n |   O\n |  /|\\ \n |  / \\ \n_|_",
                            " _____\n |   |\n |   O\n |  /|\\ \n |  \n_|_",
                            " _____\n |   |\n |   O\n |  \n | \n_|_",
                            " _____\n |   |\n |   \n |  \n |  \n_|_",
                            " _____\n | \n | \n | \n | \n_|_",
                            " \n | \n |  \n |  \n |  \n_|_",
                            " \n \n \n \n \n__",
                            ""]
    var isOver = false
    var won: Bool?
    
    var currentDrawing: String {
        return drawings[scoreOfTheWord]
    }
    
    var wordFound: Bool {
        return wordOfView == word
    }
    
    // MARK: - Methods
    init() {
        newWord()
    }
    
    private func newWord() {
        let randomNumber = Int.random(in: 0 ..< words.count)
        let randomWord = words[randomNumber]
        word = Array(randomWord.lowercased())
        
        wordOfView = []
        for _ in 0..<word.count {
            wordOfView.append("-")
        }
    }
    
    func playerPlays(withLetter letter: Character) {
        if !isOver {
            var letterFound = false
            
            for (index, character) in word.enumerated() {
                if character == letter {
                    wordOfView[index] = letter
                    letterFound = true
                }
            }
            
            if wordFound {
                isOver = true
                won = true
            } else if !letterFound {
                scoreOfTheWord -= 1
                if scoreOfTheWord == 0 {
                    isOver = true
                    won = false
                }
            }
        }
    }

}
