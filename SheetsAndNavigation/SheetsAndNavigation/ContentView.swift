//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    
    @State private var selectedUser: User? = nil
    
    var body: some View {
        VStack (spacing:20) {
            Button ("Show item") {
                selectedUser = User(name: "Piseth")
            }
        }
        .sheet(item: $selectedUser, onDismiss: {
            print("Sheet closed")
        }) {
            user in
            VStack {
                Text("Hello \(user.name)")
                
                Button("Close") {
                    selectedUser = nil
                }
            }
        }
    }
        
}

#Preview {
    ContentView()
}
