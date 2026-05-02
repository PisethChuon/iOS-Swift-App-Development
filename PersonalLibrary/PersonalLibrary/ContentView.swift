import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            BookListView(searchText: searchText)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add book") { addBook() }
                }
                .navigationTitle("My Library")
        }
    }
    
    func addBook() {
        let book = Book(
            title: "Book \(Int.random(in: 0...100))",
            author: "Author"
        )
        context.insert(book)
    }
    
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
                ForEach(books, id: \.id) { book in
                    VStack(alignment: .leading) {
                        Text(book.title).font(.headline)
                        Text(book.author).font(.subheadline)
                        Text(book.isRead ? "✅ Read" : "📖 Unread")
                    }
                    .onTapGesture {
                        book.isRead.toggle() // ← direct update, no save needed
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { context.delete(books[$0]) }
                }
            }
        }
        
    }
}
    
    
    #Preview {
        ContentView()
    }
