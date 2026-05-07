//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 7/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                Text("Friends")
            }
        }
    }
}

#Preview {
    ContentView()
}
