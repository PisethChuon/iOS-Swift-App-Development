//
//  FavoriteFruitsApp.swift
//  FavoriteFruits
//
//  Created by chuonpiseth on 5/4/26.
//

import SwiftUI
import CoreData

@main
struct FavoriteFruitsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
