//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by chuonpiseth on 4/5/26.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0),
    ]
    
    var state = GameState.setup
}
