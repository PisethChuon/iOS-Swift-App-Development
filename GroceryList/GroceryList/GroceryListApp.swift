//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by chuonpiseth on 5/5/26.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: GroceryList.self)
    }
}
