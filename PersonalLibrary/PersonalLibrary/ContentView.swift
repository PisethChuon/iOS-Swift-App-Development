import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @State private var searchText = ""
    @State private var isPresentingAdd = false
    
    var body: some View {
        let viewModel = BookViewModel(context: context)
        
        NavigationStack {
            BookListView(searchText: searchText)
                .navigationTitle("Library")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isPresentingAdd = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isPresentingAdd) {
                    AddBookView(viewModel: viewModel)
                }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
    }
}

#Preview {
    ContentView()
}
