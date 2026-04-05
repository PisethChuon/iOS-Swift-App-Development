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
                addFruit()
            }
        }
        .padding()
    }
    
    func addFruit() {
        guard !fruitName.isEmpty, let qty = Int16(quantity) else { return }
        
        let newFruit = Fruit(context: viewContext)
        newFruit.name = fruitName
        newFruit.quantity = qty
        
        do {
            try viewContext.save()
            fruitName = ""
            quantity = ""
            print("Fruit saved!")
        } catch {
            print("Error saving fruit: \(error)")
        }
    }
}


#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
