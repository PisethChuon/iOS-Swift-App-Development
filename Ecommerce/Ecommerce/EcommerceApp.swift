//
//  EcommerceApp.swift
//  Ecommerce
//

import SwiftUI

@main
struct EcommerceApp: App {
    
    @State var favoritesManager = FavoritesManager()
    @State var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favorites")
                    }
            }
            .environment(favoritesManager)
            .environment(cartManager)
            .preferredColorScheme(.light)
        }
    }
}
