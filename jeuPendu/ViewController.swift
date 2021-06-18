//
//  ViewController.swift
//  jeuPendu
//
//  Created by Benjamin GOUGUET on 06/11/2014.
//  Copyright (c) 2014 Benjamin GOUGUET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var part = Part()
    let mediumImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var drawingLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet var lettersButton: [UIButton]!
    
    // MARK: - Actions
    @IBAction func lettersTapped(_ sender: UIButton) {
        if let letter = sender.currentTitle {
            if !part.currentGame.isOver {
                mediumImpactFeedbackGenerator.impactOccurred()
                part.playerPlayed(whithLetter: Character(letter.lowercased()))
                sender.isEnabled = false
                sender.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
                updateUI()
            }
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        mediumImpactFeedbackGenerator.impactOccurred()
        if !part.isOver && part.currentGame.won == true {
            part.addNewGame()
        } else {
            part = Part()
        }
        
        for letter in lettersButton {
            letter.isEnabled = true
            letter.setTitleColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), for: UIControl.State.normal)
        }
        updateUI()
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mediumImpactFeedbackGenerator.prepare()
        updateUI()
    }
    
    private func updateUI() {
        wordLabel.text = String(part.currentGame.wordOfView)
        drawingLabel.text = part.currentGame.currentDrawing
        scoreLabel.text = "Score : \(part.score)"
        bestScoreLabel.text = "Meilleur Score : \(part.bestScore)"
        
        if part.isOver {
            gameOverLabel.text = "GAME OVER"
            wordLabel.text = String(part.currentGame.word)
            animateGameOverLabel()
        } else if part.currentGame.won == true {
            gameOverLabel.text = "GAGNÉ !"
            animateGameOverLabel()
        } else {
            gameOverLabel.isHidden = true
            drawingLabel.textColor = .black
        }
    }
    
    private func animateGameOverLabel() {
        drawingLabel.textColor = UIColor(white: 0, alpha: 0.2)
        gameOverLabel.isHidden = false
        gameOverLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: [], animations: {
            self.gameOverLabel.transform = .identity
        }, completion:nil)
    }
   
}
