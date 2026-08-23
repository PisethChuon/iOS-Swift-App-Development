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
                CartView()
                FavoritesView()
            }
            .preferredColorScheme(.light)
        }
    }
}
