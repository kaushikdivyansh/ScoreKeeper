//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Divyansh Kaushik on 6/6/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {
    
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Eve", score: 5),
            Player(name: "Frank", score: 0)
        ])
        
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Eve", score: 5),
                Player(name: "Frank", score: 0)
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Eve", score: 5)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() async throws {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Eve", score: 5),
                Player(name: "Frank", score: 0)
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Frank", score: 0)])
    }
    
}
