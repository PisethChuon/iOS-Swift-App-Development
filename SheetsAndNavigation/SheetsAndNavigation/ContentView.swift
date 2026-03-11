//
//  ContentView.swift
//  SheetsAndNavigation
//
//  Created by chuonpiseth on 7/3/26.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let title: String
}

struct ContentView: View {
    
    @State private var SelectedProduct: Product?
    
    var body: some View {
        VStack {
            Button("Show Product") {
                SelectedProduct = Product(title: "Apple")
            }
        }
        .sheet(item: $SelectedProduct) { product in
            Text("This is a \(product.title)")
        }
        
        }
    }
        

#Preview {
    ContentView()
}
