//
//  Untitled.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 7/5/26.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query private var friends: [Friend]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Text("Hello, world!")
    }
}

#Preview {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}
