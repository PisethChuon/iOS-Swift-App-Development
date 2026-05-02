import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var books: [Book] = []
    
    var body: some View {
        Button("Add Test Book") {
            let book = Book(title: "Dune", author: "Frank Herbert")
            context.insert(book)    // Write to DB
        }
    }
    
    func fetchBooks() {
        let descriptor = FetchDescriptor<Book>(
            shortBy: [SortDescriptor(\.title)]
        )
        books = (try? context.fetch(descriptor)) ??? []
    }
}


#Preview {
    ContentView()
}
