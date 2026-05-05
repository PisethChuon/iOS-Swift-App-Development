//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by chuonpiseth on 5/5/26.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Friend.self)
    }
}
