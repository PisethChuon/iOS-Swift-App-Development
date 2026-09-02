//
//  ProductView.swift
//  FindOut
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct ProductView: View {
    
    //    @Environment(FavoritesStore.self) private var favoritesStore
    
    //    var body: some View {
    //        List {
    //            ForEach(products) { product in
    //                HStack {
    //                    Text(product.name)
    //                    Spacer()
    //                    Button {
    //                        favoritesStore.toggleFavorite(product)
    //                    } label: {
    //                        Image(systemName: favoritesStore.isFavorite(product) ? "heart.fill" : "heart")
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    var body: some View {
        VStack {
            Text("Knock, knock!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
    
}

#Preview {
    ProductView()
    //        .environment(FavoritesStore())
}
