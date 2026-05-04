//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by chuonpiseth on 3/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ScoreKeeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            Spacer()
            
            switch scoreboard.state {
            case .setup:
                Button("Start Game", systemImage: "play.fill") {
                    scoreboard.state = .playing
                }
            default:
                EmptyView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
