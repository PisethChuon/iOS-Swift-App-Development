//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 7/5/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    
    init (name: String) {
        self.name = name
    }
}
