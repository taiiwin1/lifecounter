//
//  ViewController.swift
//  lifecounterv2
//
//  Created by Tai Nguyen on 2/3/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var player1LifeLabel: UILabel!
    @IBOutlet weak var player2LifeLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    
    var player1Life = 20
    var player2Life = 20
    
    @IBOutlet weak var p1ChunkField: UITextField!
    @IBOutlet weak var p2ChunkField: UITextField!
    
    var gameHistory: [String] = []
    var gameStarted = false
    var playerCount = 2
    
    @IBOutlet weak var addPlayerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loseLabel.text = "Game in Progress..."
    }
    
    @IBAction func addPlayerTapped(_ sender: UIButton) {
        if playerCount < 8 {
            playerCount += 1
            // ... 
        }
    }
    
    @IBAction func historyTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let historyVC = storyboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        historyVC.history = gameHistory
        present(historyVC, animated: true, completion: nil)
    }
    
    
    // player 1 actions
    @IBAction func p1Plus(_ sender: UIButton) {
        player1Life += 1
        gameStarted = true
            
        let entry = "Player 1 gained 1 life (Total: \(player1Life))"
        gameHistory.append(entry)
        
        updateUI()
    }

    @IBAction func p1Minus(_ sender: UIButton) {
        player1Life -= 1
        gameStarted = true
            
        let entry = "Player 1 lost 1 life (Total: \(player1Life))"
        gameHistory.append(entry)
        
        updateUI()
    }
    
    @IBAction func p1ChunkPlus(_ sender: UIButton) {
        let amount = Int(p1ChunkField.text ?? "") ?? 0
        
        player1Life += amount
        gameStarted = true
        
        gameHistory.append("Player 1 gained \(amount) life (Total: \(player1Life))")
        
        updateUI()
        p1ChunkField.text = ""
    }
    
    @IBAction func p1ChunkMinus(_ sender: UIButton) {
        let amount = Int(p1ChunkField.text ?? "") ?? 0
        
        player1Life -= amount
        gameStarted = true
        
        gameHistory.append("Player 1 lost \(amount) life (Total: \(player1Life))")
        
        updateUI()
        p1ChunkField.text = ""
    }
    
    // player 2 actions 
    @IBAction func p2Plus(_ sender: UIButton) {
        player2Life += 1
        gameStarted = true
            
        let entry = "Player 2 gained 1 life (Total: \(player2Life))"
        gameHistory.append(entry)
        
        updateUI()
    }
    
    @IBAction func p2Minus(_ sender: UIButton) {
        player2Life -= 1
        gameStarted = true
            
        let entry = "Player 2 lost 1 life (Total: \(player2Life))"
        gameHistory.append(entry)
        
        updateUI()
    }
    
    @IBAction func p2ChunkPlus(_ sender: UIButton) {
        let amount = Int(p2ChunkField.text ?? "") ?? 0
        
        player2Life += amount
        gameStarted = true
        
        gameHistory.append("Player 2 gained \(amount) life (Total: \(player2Life))")
        
        updateUI()
        p2ChunkField.text = ""
    }
    
    @IBAction func p2ChunkMinus(_ sender: UIButton) {
        let amount = Int(p2ChunkField.text ?? "") ?? 0
        
        player2Life -= amount
        gameStarted = true
        
        gameHistory.append("Player 2 lost \(amount) life (Total: \(player2Life))")
        
        updateUI()
        p2ChunkField.text = ""
    }
    
    // helper function
    func updateUI() {
        player1LifeLabel.text = "\(player1Life)"
        player2LifeLabel.text = "\(player2Life)"
        
        if player1Life <= 0 {
            loseLabel.text = "Player 1 LOSES!"
        } else if player2Life <= 0 {
            loseLabel.text = "Player 2 LOSES!"
        } else {
            loseLabel.text = "Game in Progress..."
        }
    }
}
