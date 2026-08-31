//
//  FavoritesView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(FavoritesManager.self) var favoritesManager: FavoritesManager
    
    fileprivate func FavoriteProductRow(product: Product) -> some View {
        HStack {
            Image(product.image)
                .squareImageStyle()
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.system(size: 15, weight: .semibold))
                Text(product.description)
                    .lineLimit(2)
                    .font(.system(size: 15))
                    .padding(.top, 1)
            }
            Button(action: {
                favoritesManager.products.removeAll(where: { $0.id == product.id })
            }, label: {
                Image(systemName: "heart.fill")
                    .foregroundStyle(Color.blue)
            })
        }
    }
    
    var body: some View {
        VStack {
            List (favoritesManager.products) { product in
                FavoriteProductRow(product: product)
            }
        }
        .overlay {
            if favoritesManager.products.isEmpty {
                Text("No favorites")
            }
        }
    }
}

#Preview {
    FavoritesView()
        .environment(FavoritesManager())
}
