//
//  ContentView.swift
//  Income
//
//  Created by chuonpiseth on 21/3/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var transactions: [Transaction] = [
        Transaction(title: "Apple", amount: 5.00, type: .expense, date: Date())
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(transactions) { transaction in
                    HStack {
                        Image(systemName: transaction.type == .income ? "arrow.up.forward" : "arrow.down.forward")
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
