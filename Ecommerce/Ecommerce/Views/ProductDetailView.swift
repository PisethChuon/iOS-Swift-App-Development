//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 22/8/26.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(product.image)
                    .bannerImageStyle()
                Group {
                    Text(product.title)
                        .font(.system(size: 20, weight: .semibold))
                    Text(product.description)
                        .font(.system(size: 15))
                        .padding(.top)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Add to cart")
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.top, 15)
                }
                .padding(.horizontal)
                
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
}
