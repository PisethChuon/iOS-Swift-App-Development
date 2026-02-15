import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var isPreminum: Bool = false
    
    var body: some View {
        VStack {
            ProfileForm(username: $username, isPreminum: $isPreminum)
            
        }
    }
}

// Chil State

struct ProfileForm: View {
    
    @Binding var username: String
    @Binding var isPreminum: Bool
    
    var body: some View {
        TextField("Enter username", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
        Text("Hello, \(username)")
        Toggle("Priminum", isOn: $isPreminum)
            .padding()
    }
        
}

#Preview {
    ContentView()
}
