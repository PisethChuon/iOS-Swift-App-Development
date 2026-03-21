//
//  ContentView.swift
//  List
//
//  Created by chuonpiseth on 19/3/26.
//

import SwiftUI



struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let colors: String
}

struct ContentView: View {
    
    let fruits = [
        Fruit(name: "Apple", colors: "Red"),
        Fruit(name: "Banana", colors: "Yellow"),
        Fruit(name: "Orange", colors: "Orange")
    ]
    
    var body: some View {
        List (fruits) { fruit in
            HStack {
                Image(systemName: "applelogo")
                Text(fruit.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
