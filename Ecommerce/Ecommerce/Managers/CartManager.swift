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
    var products: [Product] = ProductsClient.fetchProducts()
}
