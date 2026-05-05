//
//  ContentView.swift
//  Birthdays
//
//  Created by chuonpiseth on 5/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Phanit", birthday: .now),
        Friend(name: "Piseth", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
