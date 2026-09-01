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
        productsInCart.reduce(0) { $0 + $1.quantity }
    }
    
    var displayTotalCartPrice: String {
        let totalPrice = productsInCart.reduce(0) { $0 + ($1.product.price * Int($1.quantity)) }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: totalPrice as NSNumber) ?? "$0.00"
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
    }
    
    func removeFromCart(product: Product) {
        if let indexOfProductInCart = productsInCart.firstIndex(where: { $0.id == product.id}) {
            let currentProductInCart = productsInCart[indexOfProductInCart].quantity
            if currentProductInCart > 1 {
                let newQuantity = currentProductInCart - 1
                let updatedProductInCart = ProductInCart(product: product, quantity: newQuantity)
                productsInCart[indexOfProductInCart] = updatedProductInCart
            } else {
                productsInCart.remove(at: indexOfProductInCart)
            }
        }
    }
    
    func pay() {
        
    }
}

