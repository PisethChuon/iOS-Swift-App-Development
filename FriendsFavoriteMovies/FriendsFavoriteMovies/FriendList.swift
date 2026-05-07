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
        List {
            ForEach(friends) { friend in
                    Text(friend.name)
            }
        }
        .task {
            context.insert(Friend(name: "Heng"))
            context.insert(Friend(name: "Kholine"))
        }
    }
}

#Preview {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}
