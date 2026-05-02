import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State private var books: [Book] = []
    
    var body: some View {
        NavigationStack {
            
        }
    }
    
//    func fetchBooks() {
//        let descriptor = FetchDescriptor<Book>(
//            shortBy: [SortDescriptor(\.title)]
//        )
//        books = (try? context.fetch(descriptor)) ??? []
//    }
}


#Preview {
    ContentView()
}
