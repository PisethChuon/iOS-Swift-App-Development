//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    
    let users = ["Anna", "John", "Piseth"]
    
    var body: some View {
        NavigationStack {
            List(users, id: \.self) { user in
                NavigationLink(user, value: user)
            }
            .navigationTitle(Text("Users"))
            .navigationDestination(for: String.self) { user in
            Text("Profile of \(user)")}
        }
        
    }
}


#Preview {
    ContentView()
}
