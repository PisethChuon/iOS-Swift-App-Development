//
//  ContentView.swift
//  Income
//
//  Created by chuonpiseth on 21/3/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var transactions: [Transaction] = [
        Transaction(title: "Apple", amount: 5.00, type: .expense, date: Date()),
        Transaction(title: "Apple", amount: 5.00, type: .expense, date: Date())
        
    ]
    
    var body: some View {
        TransactionView(transactions: transactions)
    }
}

#Preview {
    ContentView()
}
