import SwiftUI

struct ContentView: View {
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            SecureField("Passowrd", text: $password)
                .textFieldStyle(.roundedBorder)
        }
    }
}


#Preview {
    ContentView()
}
