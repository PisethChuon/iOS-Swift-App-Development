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
    
    var featuredProducts = ProductsClient.fetchProducts().filter({ $0.isFeatured })
}
