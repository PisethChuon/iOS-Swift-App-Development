//
//  ContentView.swift
//  GridPractice
//
//  Created by chuonpiseth on 20/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Hello")
                Image(systemName: "globe")
            }
            GridRow {
                Image(systemName: "hand.wave")
                Text("World")
            }
        }
    }
}

#Preview {
    ContentView()
}
