//
//  ProductDetailView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 22/8/26.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(CartManager.self) var cartManager: CartManager
    let product: Product
    
    var body: some View {
        
        @Bindable var cartManager = cartManager
        
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
                        cartManager.addToCart(product: product)
                        cartManager.addToCartAlert = true
                    }, label: {
                        Text("Add to cart")
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.top, 15)
                }
                .padding(.horizontal)
                
                
                Spacer()
            }
            .alert("Add to cart", isPresented: $cartManager.addToCartAlert) {
                Button("Ok") {
                    
                }
            } message: {
                Text("You have add \(product.title) to your cart")
            }
        }
        
    }
}

#Preview {
    ProductDetailView(product: ProductsClient.fetchProducts()[0])
        .environment(CartManager())
}
