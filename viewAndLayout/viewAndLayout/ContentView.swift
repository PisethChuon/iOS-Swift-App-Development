import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var isPremium: Bool = false
    
    var body: some View {
        VStack {
            ProfileForm(username: $username, isPremium: $isPremium)
        }
    }
}

// Chill
struct ProfileForm: View {

    @Binding var username: String
    @Binding var isPremium: Bool

    var body: some View {
        
        TextField("Enter username", text: $username)
            .textFieldStyle(.roundedBorder)
        
        Text("Hello, \(username)")
            .padding()
            .background(Color.blue)
        Toggle("Premium", isOn: $isPremium)
    }
}

#Preview {
    ContentView()
}
