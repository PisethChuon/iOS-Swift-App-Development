//
//  CartManager.swift
//  Ecommerce
//
//  Created by chuonpiseth on 31/8/26.
//

import Foundation
import SwiftUI

@Observable
class CartManager {
    var productsInCart: [ProductInCart] = []
    
    func addToCart(product: Product) {
        if var productInCart = productsInCart.first(where: { $0.id == product.id }) {
            productInCart.quantity += 1
        } else {
            productsInCart.append(ProductInCart(product: product, quantity: 1))
        }
    }
}
