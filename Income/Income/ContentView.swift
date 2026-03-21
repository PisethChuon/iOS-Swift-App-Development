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
    
//    fileprivate func BalanceView() -> some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 8)
//        }
//        .frame(height: 150)
//    }
    
    var body: some View {
        VStack {
            
            List {
                ForEach(transactions) { transaction in
                    TransactionView(transaction: transaction)
                }
            }
            .scrollContentBackground(.hidden)
        }
        
        
    }
}

#Preview {
    ContentView()
}
