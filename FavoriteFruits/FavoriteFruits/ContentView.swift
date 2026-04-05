//
//  ContentView.swift
//  FavoriteFruits
//
//  Created by chuonpiseth on 5/4/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var fruitName = ""
    @State private var quantity = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Fruit name", text: $fruitName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Quantity", text: $quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add Fruit") {
                
            }
        }
        .padding()
    }
    
    
}


#Preview {
    ContentView()
}
