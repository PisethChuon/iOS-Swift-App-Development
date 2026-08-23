//
//  FindOutApp.swift
//  FindOut
//
//  Created by chuonpiseth on 9/8/26.
//

import SwiftUI

@main
struct FindOutApp: App {

    @State private var favoritesStore = FavoritesStore()

    var body: some Scene {
        WindowGroup {
            TabView {
                ProductView()
                    .tabItem {
                        Label("Product", systemImage: "bag")
                    }

                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
            .environment(favoritesStore)
        }
    }
}
