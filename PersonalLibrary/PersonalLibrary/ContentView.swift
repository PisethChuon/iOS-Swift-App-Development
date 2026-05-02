import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var books: [Book] = []
    
    var body: some View {
        NavigationStack {
            List(books, id: \.id) { book in
                VStack(alignment: .leading) {
                    Text(book.title).font(.headline)
                    Text(book.author).font(.subheadline)
                    Text(book.isRead ? "Red" : "Unread")
                }
            }
            .toolbar{
                Button("Add Book") { addBook() }
            }
            .onAppear{ fetchBooks() }
        }
    }
    
    func fetchBooks() {
        let descriptor = FetchDescriptor<Book>(
            sortBy: [SortDescriptor(\.title)]
        )
        books = (try? context.fetch(descriptor)) ?? []
    }
    
    func addBook() {
           let book = Book(title: "Book \(Int.random(in: 1...100))", author: "Author")
           context.insert(book)
           fetchBooks() // refresh list
    }
}


#Preview {
    ContentView()
}
