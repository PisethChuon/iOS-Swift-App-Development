//
//  FavoritesView.swift
//  FindOut
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(FavoritesStore.self) private var favoritesStore
    
    var favoriteProducts: [Product] {
        products.filter { product in
            favoritesStore.isFavorite(product)
        }
    }
    
    var body: some View {
        List {
            ForEach(favoriteProducts) { product in
                    HStack {
                        Text(product.name)
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environment(FavoritesStore())
}
