import SwiftUI

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
            ToggleView(isOn: $isOn)
            Text(isOn ? "ON" : "OFF")
        }
    }
}

// Chill View
struct ToggleView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Swiftch", isOn: $isOn)
            .padding()
    }
}

#Preview {
    ContentView()
}
