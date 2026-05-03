import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [Book]
    @Environment(\.modelContext) private var context
    
    init(searchText: String) {
        _books = Query(
            filter: #Predicate<Book> {
                searchText.isEmpty ? true : $0.title.contains(searchText)
            },
            sort: \Book.title
        )
    }
    
    var body: some View {
        List {
            ForEach(books) { book in
                BookRowView(book: book)
            }
            .onDelete { indexSet in
                indexSet.forEach { context.delete(books[$0]) }
            }
        }
    }
}

struct BookRowView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(book.title)
                .font(.headline)
            Text(book.author?.name ?? "Unknown Author")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(book.isRead ? "✅ Read" : "📖 Unread")
                .font(.caption)
        }
        .padding(.vertical, 4)
        .onTapGesture {
            book.isRead.toggle()
        }
    }
}
