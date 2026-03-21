//
//  FruitViewModel.swift
//  List
//
//  Created by chuonpiseth on 21/3/26.
//

import Foundation
import SwiftUI
import Combine

struct Fruit: Identifiable {
    var id = UUID()
    var name: String
}

class FruitViewModel: ObservableObject {
    @Published var fruits = [
        Fruit(name: "Apple")
        Fruit(name: "Banana")
        Fruit(name: "Orange")
    ]
}



