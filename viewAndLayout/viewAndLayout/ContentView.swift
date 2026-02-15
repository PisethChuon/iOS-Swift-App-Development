//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    var body: some View {
        VStack {
            Button (isPlaying ? "Pause" : "Play") {
                isPlaying.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
