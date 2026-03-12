//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct ContentView: View {
    
    let fruites = ["Apple", "Banaba", "Mango"]
    
    var body: some View {
        NavigationStack {
            List(fruites, id: \.self) { fruite in
                NavigationLink(fruite, value: fruite)
            }
            .navigationTitle(Text("Fruites"))
            .navigationDestination(for: String.self) { fruite in
                Text("Fruite Detail")
                Text("You selected: \(fruite)")}
        }
    }
}

#Preview {
    ContentView()
}
