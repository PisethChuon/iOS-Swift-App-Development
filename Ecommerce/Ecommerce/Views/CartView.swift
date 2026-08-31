//
//  CartView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct CartView: View {
    
    @Environment(CartManager.self) var cartManager: CartManager
    @State private var quantity: Int = 0
    
    fileprivate func CartRow(product: Product) -> some View {
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
                Stepper("Quantity: \(quantity)", onIncrement: {
                    
                }, onDecrement: {
                    
                })
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.products) { product in
                    CartRow(product: product)
                }
                
            }
            
        }
    }
}

#Preview {
    CartView()
        .environment(CartManager())
}
