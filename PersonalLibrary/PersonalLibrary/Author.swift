//
//  Author.swift
//  PersonalLibrary
//
//  Created by chuonpiseth on 2/5/26.
//

import SwiftData

@Model
class Author {
    var name: String
    var biography: String
    
    @Relationship(deleteRule: .cascade, inverse: \Book.author)
    var books: [Book] = []
    
    init(name: String, biography: String = "") {
        self.name = name
        self.biography = biography
    }
}
