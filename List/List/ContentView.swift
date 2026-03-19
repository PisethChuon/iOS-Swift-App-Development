//
//  ContentView.swift
//  List
//
//  Created by chuonpiseth on 19/3/26.
//

import SwiftUI

struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

// Keep data at file scope if desired (no property wrappers here)
private let oceans: [Ocean] = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

struct ContentView: View {
    // @State must be inside a View
    @State private var multiSelection: Set<Ocean.ID> = []

    var body: some View {
        NavigationStack {
            List(oceans, selection: $multiSelection) { ocean in
                Text(ocean.name)
            }
            .navigationTitle("Oceans")
            .toolbar { EditButton() }
        }
        // If you want to show the selection count, include it inside the stack
        .safeAreaInset(edge: .bottom) {
            Text("\(multiSelection.count) selections")
                .font(.footnote)
                .padding(.vertical, 8)
        }
    }
}

#Preview {
    ContentView()
}
