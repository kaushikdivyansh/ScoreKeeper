//
//  Player.swift
//  ScoreKeeper
//
//  Created by Divyansh Kaushik on 6/5/25.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
