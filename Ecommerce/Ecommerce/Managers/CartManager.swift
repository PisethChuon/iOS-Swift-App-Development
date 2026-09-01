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
    var addToCartAlert: Bool = false
    
    var displayTotalCartQuantity: Int {
        productsInCart.reduce(1) { $0 + $1.quantity }
    }
    
    
    func addToCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id }) {
            let currentProductInCart = productsInCart[indexOfProductInCart].quantity
            let newQuantity = currentProductInCart + 1
            let updatedProductInCart = ProductInCart(product: product, quantity: newQuantity)
            productsInCart[indexOfProductInCart] = updatedProductInCart
            
        } else {
            productsInCart.append(ProductInCart(product: product, quantity: 1))
        }
        addToCartAlert = true
    }
}

