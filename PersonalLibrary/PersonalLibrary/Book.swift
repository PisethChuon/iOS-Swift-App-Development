import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var isRead: Bool
    var dateAdded: Date
    
    init(title: String, author: String, isRead: Bool = false) {
        self.title = title
        self.author = author
        self.isRead = isRead
        self.dateAdded = Date()
    }
}
