import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = TodoListViewModel()
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(colors: [Color.blue.opacity(0.15), Color.purple.opacity(0.15)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                // Header
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(vm.title)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.primary)
                        Text("Stay on top of your day")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    // Quick Add button mirrors control view action if available
                    Button {
                        // Optional quick add example
                        vm.addTodo("New Task")
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(.tint)
                            .symbolRenderingMode(.hierarchical)
                            .padding(8)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                    .accessibilityLabel("Add new task")
                }
                .padding(.horizontal)
                .padding(.top, 8)

                // Card container for list and controls
                VStack(spacing: 0) {
                    // Display list
                    TodoListDisplayView(vm: vm)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 6)

                    // Divider between list and controls
                    Divider()
                        .padding(.horizontal)

                    // Controls
                    HStack {
                        TodoListControlView(vm: vm)
                        Spacer()
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .padding(.horizontal)

                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ContentView()
}
