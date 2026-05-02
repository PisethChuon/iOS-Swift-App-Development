import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
    }
    
    func addBook() {
        let book = Book(
            title: "Book \(Int.random(in: 0...100))",
            author: "Author"
        )
        context.insert(book)
    }
    
}


#Preview {
    ContentView()
}
