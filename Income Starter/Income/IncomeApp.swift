//
//  IncomeApp.swift
//  Income
//
//

import SwiftUI

@main
struct IncomeApp: App {
    
    let dataManager = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
