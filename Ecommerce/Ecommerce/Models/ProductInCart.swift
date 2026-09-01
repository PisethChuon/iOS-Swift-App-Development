//
//  ProductInCart.swift
//  Ecommerce
//
//  Created by chuonpiseth on 1/9/26.
//

import Foundation
import SwiftUI

struct ProductInCart: Identifiable {
    var id: String { product.id }
    let product: Product
    var quantity: Int
}
