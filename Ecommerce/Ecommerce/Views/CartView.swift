//
//  CartView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct CartView: View {
    
    @Environment(CartManager.self) var cartManager: CartManager
    
    fileprivate func CartRow(productIncart: ProductInCart) -> some View {
        HStack {
            Image(productIncart.product.image)
                .squareImageStyle()
            VStack(alignment: .leading) {
                Text(productIncart.product.title)
                    .font(.system(size: 15, weight: .semibold))
                Text(productIncart.product.description)
                    .lineLimit(2)
                    .font(.system(size: 15))
                    .padding(.top, 1)
                Stepper("Quantity: \(productIncart.quantity)", onIncrement: {
                    
                }, onDecrement: {
                    
                })
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.productsInCart) { productInCart in
                    CartRow(productIncart: productInCart)
                }
                
            }
            
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
