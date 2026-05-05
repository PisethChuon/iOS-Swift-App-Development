//
//  ContentView.swift
//  GroceryList
//
//  Created by chuonpiseth on 5/5/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var groceryLists: [GroceryList]
    @Environment(\.modelContext) private var context
    
    @State private var itemName = ""
    @State private var isCart: Bool = false
    
    var body: some View {
        NavigationStack {
            List(groceryLists) { groceryList in
                HStack {
                    Text("\(groceryList.items)")
                        .bold()
                    Spacer()
                    
                    Toggle("", isOn: $isCart)
                }
            }
            
            .navigationTitle("Grocery List")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Item")
                        .font(.headline)
                    TextField("Item Name", text: $itemName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 100)
                    Button("Add item") {
                        let newItem = GroceryList(items: itemName)
                        context.insert(newItem)
                        
                        itemName = ""
                    }
                }
                .padding()
                .background(.bar)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: GroceryList.self, inMemory: true)
}
