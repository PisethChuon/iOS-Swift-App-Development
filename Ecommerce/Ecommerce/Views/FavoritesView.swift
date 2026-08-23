//
//  FavoritesView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @State var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack {
            List (viewModel.products) { product in
                HStack {
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.system(size: 15, weight: .semibold))
                        Text(product.description)
                            .lineLimit(2)
                            .font(.system(size: 15))
                            .padding(.top, 1)
                    }
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(Color.blue)
                    })
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
