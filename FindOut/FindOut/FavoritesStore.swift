//
//  FavoritesStore.swift
//  FindOut
//
//  Created by chuonpiseth on 23/8/26.
//

import Observation

@Observable
class FavoritesStore{
    var favoriteProductIDs: Set<Int> = []
    
    func toggleFavorite(_ product: Product) {
        if favoriteProductIDs.contains(product.id) {
            favoriteProductIDs.remove(product.id)
        } else {
            favoriteProductIDs.insert(product.id)
        }
    }
    
    func isFavorite(_ product: Product) -> Bool {
        favoriteProductIDs.contains(product.id)
    }
}
