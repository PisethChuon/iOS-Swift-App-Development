import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Button("Add Test Book") {
            let book = Book(title: "Dune", author: "Frank Herbert")
            context.insert(book)    // Write to DB
        }
    }
}
