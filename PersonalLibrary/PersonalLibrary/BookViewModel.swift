//
//  BookViewModel.swift
//  PersonalLibrary
//
//  Created by chuonpiseth on 3/5/26.
//

import SwiftData
import SwiftUI

@Observable
class BookViewModel {
    var searchText = ""
    var showUnreadOnly = false
    
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchBooks() -> [Book] {
        let descriptor = FetchDescriptor<Book>(
            sortBy: [SortDescriptor(\.title)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func addBook(title: String, authorName: String) {
        guard !title.isEmpty else {return}
        
        let author = Author(name: authorName)
        let book = Book(title: title)
        book.author = author
        
        context.insert(author)
        context.insert(book)
    }
}

