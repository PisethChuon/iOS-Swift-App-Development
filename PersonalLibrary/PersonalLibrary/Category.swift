//
//  Category.swift
//  PersonalLibrary
//
//  Created by chuonpiseth on 2/5/26.
//

import SwiftData

@Model
class Category {
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Book.categories)
    var books: [Book] = []
    
    init(name: String, ) {
        self.name = name
    }
}
