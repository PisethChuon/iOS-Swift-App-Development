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
                    VStack {
                        HStack {
                            Spacer()
                            Text(transaction.displayDate)
                                .font(.system(size: 14))
                            Spacer()
                        }
                        .padding(.vertical, 5)
                        .background(Color.lightGrayShade.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        HStack {
                            Image(systemName: transaction.type == .income ? "arrow.up.forward" : "arrow.down.forward")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(transaction.type == .income ? .green : .red)
                            VStack (alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(transaction.title)
                                        .font(.system(size: 15, weight: .bold))
                                    Spacer()
                                    Text(String(transaction.amount))
                                        .font(.system(size: 15, weight: .bold))
                                }
                                Text("Completed")
                                    .font(.system(size: 14))
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
