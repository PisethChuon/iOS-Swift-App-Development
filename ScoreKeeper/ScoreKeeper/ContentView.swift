//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by chuonpiseth on 3/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [String] = ["Elisha", "Andre", "Jasmine"]
    @State private var score: [Int] = [0, 0, 0]
    
    var body: some View {
        VStack {
            ForEach(0..<players.count, id: \.description) { index in
                TextField("Name", text: $players[index])
                Stepper("\(score[index])", value: $score[index])
            }
            Button("Add Player", systemImage: "plus") {
                players.append("")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
