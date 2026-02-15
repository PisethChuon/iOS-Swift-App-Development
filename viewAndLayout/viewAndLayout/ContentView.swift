import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    print("User pressed return")
                }
        }
    }
}


#Preview {
    ContentView()
}
