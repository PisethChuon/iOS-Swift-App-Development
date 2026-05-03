//
//  Player.swift
//  ScoreKeeper
//
//  Created by chuonpiseth on 3/5/26.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
