//
//  ContentView.swift
//  List
//
//  Created by chuonpiseth on 19/3/26.
//

import SwiftUI



// Keep data at file scope if desired (no property wrappers here)


struct ContentView: View {
    let fruits = ["Apple", "Banana", "Orange", "Pineapple", "Strawberry"]

    var body: some View {
        List (fruits, id: \.self) { fruit in
            Text(fruit)
        }
    }
}

#Preview {
    ContentView()
}
