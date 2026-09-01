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
                    cartManager.addToCart(product: productIncart.product)
                }, onDecrement: {
                    cartManager.removeFromCart(product: productIncart.product)
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
            VStack {
                Divider()
                HStack {
                    Text("Total: \(cartManager.displayTotalCartQuantity) items")
                        .font(.system(size: 16, weight: .semibold))
                    Spacer()
                    Text(cartManager.displayTotalCartPrice)
                        .font(.system(size: 16, weight: .bold))
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
            }
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
