//
//  ProductGridViewModel.swift
//  Ecommerce
//
//  Created by chuonpiseth on 22/8/26.
//

import Foundation
import SwiftUI

@Observable
class ProductGridViewModel {
    let filter: ProductFilter
    
    var products: [Product] {
        switch filter {
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter({ $0.isFeatured })
        case .highlyRated:
            ProductsClient.fetchProducts().filter({ $0.rating > 4 })
        }
    }
    
    init(filter: ProductFilter) {
        self.filter = filter
    }
}
