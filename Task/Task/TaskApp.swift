//
//  TaskApp.swift
//  Task
//
//  Created by chuonpiseth on 25/4/26.
//

import SwiftUI
import CoreData

@main
struct TaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
