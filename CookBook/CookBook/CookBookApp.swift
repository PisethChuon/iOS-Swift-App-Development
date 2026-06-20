//
//  CookBookApp.swift
//  CookBook
//
//

import SwiftUI

@main
struct CookBookApp: App {
    @State var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            switch sessionManager.sessionState {
            case .loggedIn:
                HomeView()
                    .environment(sessionManager)
            case .loggedOut:
                LoginView()
                    .environment(sessionManager)
            }
        }
    }
}
