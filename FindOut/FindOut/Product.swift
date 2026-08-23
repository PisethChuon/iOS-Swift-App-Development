//
//  Product.swift
//  FindOut
//
//  Created by chuonpiseth on 23/8/26.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let name: String
}

let products = [
    Product(id: 1, name: "Apple"),
    Product(id: 2, name: "Banana"),
    Product(id: 3, name: "Orange"),
]
