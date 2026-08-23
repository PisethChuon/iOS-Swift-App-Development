//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
            }
            .preferredColorScheme(.light)
        }
    }
}
