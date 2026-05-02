import SwiftData
import Foundation

@Model
class Book {
    var title: String
    var isRead: Bool
    var dateAdded: Date
    var author: Author?
    var categories: [Category] = []
    
    init(title: String, isRead: Bool = false) {
        self.title = title
        self.isRead = isRead
        self.dateAdded = Date()
    }
}
