//
//  HomeViewModel.swift
//  Ecommerce
//
//  Created by chuonpiseth on 16/8/26.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var showAllProducts: Bool = false
    
    func featuredProducts(filter: ProductFilter) -> [Product] {
        switch filter {
        case .all:
            ProductsClient.fetchProducts()
        case .isFeatured:
            ProductsClient.fetchProducts().filter({ $0.isFeatured })
        case .highlyRated:
            ProductsClient.fetchProducts().filter({ $0.rating > 4 })
        }
    }
}
