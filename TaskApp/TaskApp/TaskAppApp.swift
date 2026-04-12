//
//  TaskAppApp.swift
//  TaskApp
//
//  Created by chuonpiseth on 12/4/26.
//

import SwiftUI
import CoreData

@main
struct TaskAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
