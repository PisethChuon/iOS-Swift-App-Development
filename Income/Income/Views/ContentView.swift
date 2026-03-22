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
    @State private var showAddTransactionView = false
    @State private var transactionToEdit: Transaction?
    
    fileprivate func FloatingButton() -> some View {
        VStack {
            Spacer()
            NavigationLink {
                AddTransactionView(transactions: $transactions)
            } label: {
                Text("+")
                    .font(.largeTitle)
                    .frame(width: 70, height: 70)
                    .foregroundStyle(Color.white)
                    .padding(.bottom, 7)
            }
            .background(Color.primaryLightGreen)
            .clipShape(Circle())
        }
    }
    
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
        NavigationStack {
            ZStack {
                VStack {
                    BalanceView()
                    List {
                        ForEach(transactions) { transaction in
                            Button {
                                transactionToEdit = transaction
                            } label: {
                                TransactionView(transaction: transaction)
                                    .foregroundStyle(.black)
                            }
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                FloatingButton()
            }
            .navigationTitle("Income")
            .navigationDestination(item: $transactionToEdit, destination: { transactionToEdit in
                AddTransactionView(transactions: $transactions, transactionToEdit: transactionToEdit)
            })
            .navigationDestination(isPresented: $showAddTransactionView, destination: {
                AddTransactionView(transactions: $transactions)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(Color.black)
                    })
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
