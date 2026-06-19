//
//  CookBookApp.swift
//  CookBook
//
//

import SwiftUI

@main
struct CookBookApp: App {
    @StateObject var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            switch sessionManager.sessionState {
            case .loggedIn:
                HomeView()
            case .loggedOut:
                LoginView()
            }
        }
    }
}
