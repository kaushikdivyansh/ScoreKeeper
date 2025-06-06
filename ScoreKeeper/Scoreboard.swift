//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Divyansh Kaushik on 6/6/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Alice", score: 0),
        Player(name: "Bob", score: 0),
        Player(name: "Charlie", score: 0),
        Player(name: "Dave", score: 0)
    ]
    
    var state: GameState = .setup
    var doesHighestScoreWin = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighestScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(winningScore, player.score)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(winningScore, player.score)
            }
        }
        
        return players.filter { $0.score == winningScore }
    }
    
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}
