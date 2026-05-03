import SwiftUI
import SwiftData

struct LibraryView: View {
    @State var viewModel: BookViewModel  // ← @State because it's @Observable
    @State private var showAddBook = false
    
    var body: some View {
        NavigationStack {
            BookListView(searchText: viewModel.searchText)
                .searchable(text: $viewModel.searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddBook = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Toggle("Unread only", isOn: $viewModel.showUnreadOnly)
                            .toggleStyle(.button)
                    }
                }
                .navigationTitle("My Library")
                .sheet(isPresented: $showAddBook) {
                    AddBookView(viewModel: viewModel)
                }
        }
    }
}
