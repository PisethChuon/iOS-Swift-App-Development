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
    
    init(items: String) {
        self.items = items
    }
}
