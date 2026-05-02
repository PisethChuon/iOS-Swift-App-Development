import SwiftUI
import SwiftData

@main
struct PersonalLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Book.self, Author.self, Category.self]) // Create the DB
    }
}
