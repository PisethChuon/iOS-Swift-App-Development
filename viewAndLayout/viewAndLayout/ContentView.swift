import SwiftUI

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggleview(isOn: $isOn)
            Text(isOn ? "ON" : "OFF")
        }
    }
}

// Chil State

struct Toggleview: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Switch", isOn: $isOn)
            .padding()
    }
}

#Preview {
    ContentView()
}
