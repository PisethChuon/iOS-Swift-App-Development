//
//  GroceryList.swift
//  GroceryList
//
//  Created by chuonpiseth on 5/5/26.
//

import Foundation
import SwiftData


@Model
class GroceryList {
    var items: String
    var isCart: Bool = false
    
    init(items: String, isCart: Bool = false) {
        self.items = items
        self.isCart = isCart
    }
}
