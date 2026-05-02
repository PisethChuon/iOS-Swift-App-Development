import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @State private var searchText = ""
    
    var body: some View {
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
        
        
        
        var body: some View {
            
        }
    }
    
}


#Preview {
    ContentView()
}
