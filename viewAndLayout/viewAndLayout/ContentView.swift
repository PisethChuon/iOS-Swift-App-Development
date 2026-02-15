import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .font(.system(size: 20, weight: .semibold))
                .keyboardType(.alphabet)
                .textContentType(.username)
                .padding(.horizontal, 30)
                .textFieldStyle(.roundedBorder)
        }
    }
}


#Preview {
    ContentView()
}
