import SwiftUI

struct AddBookView: View {
    @State var viewModel: BookViewModel
    @State private var title = ""
    @State private var authorName = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Book Details") {
                    TextField("Title", text: $title)
                    TextField("Author", text: $authorName)
                }
            }
            .navigationTitle("Add Book")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addBook(
                            title: title,
                            authorName: authorName
                        )
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
