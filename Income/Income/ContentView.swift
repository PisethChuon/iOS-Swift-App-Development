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
    
    fileprivate func BalanceView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.primaryLightGreen)
            VStack (alignment: .leading, spacing: 8) {
                HStack {
                    VStack {
                        Text("BALANCE")
                            .font(.caption)
                            .foregroundStyle(Color.white)
                        Text("$2")
                            .font(.system(size: 42, weight: .light))
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                }
                .padding(.top)
                
                
                HStack (spacing: 25) {
                    VStack (alignment: .leading) {
                        Text("Expense")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                        Text("$22")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                    VStack (alignment: .leading) {
                        Text("Income")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(Color.white)
                        Text("$22")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                }
                Spacer()
                
            }
            .padding(.horizontal)
        }
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 5)
        .frame(height: 150)
        .padding(.horizontal)
    }
    
    var body: some View {
        VStack {
            BalanceView()
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
