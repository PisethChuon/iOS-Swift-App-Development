//
//  AddTransactionView.swift
//  Income
//
//  Created by chuonpiseth on 22/3/26.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var amount = 0.0
    @State private var transactionTtile = ""
    @State private var selectedTransactionType: TransactionType = .expense
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @Binding var transactions: [Transaction]
    var transactionToEdit: Transaction?
    @Environment(\.dismiss) var dismiss
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }
    
    
    var body: some View {
        VStack {
            TextField("0.00", value: $amount, formatter: numberFormatter)
                .font(.system(size: 60, weight: .thin))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
            Rectangle()
                .fill(Color(uiColor: UIColor.lightGray))
                .frame(height: 0.5)
                .padding(.horizontal, 30)
            Picker("Choose Type", selection: $selectedTransactionType) {
                ForEach(TransactionType.allCases) {transactionType in
                    Text(transactionType.title)
                        .tag(transactionType)
                }
            }
            TextField("Title", text: $transactionTtile)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 30)
                .padding(.top)
            Button(action: {
                guard transactionTtile.count >= 2 else {
                    alertTitle = "Invalid Title"
                    alertMessage = "Transaction title must be at least 2 characters."
                    showAlert = true
                    return
                }
                
                let transaction = Transaction(title: transactionTtile, amount: amount, type: selectedTransactionType, date: Date())
                
                transactions.append(transaction)
                dismiss()
                
            }, label: {
                Text("Create")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color(.white))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryLightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            .padding(.top)
            .padding(.horizontal, 30)
            Spacer()
        }
        .onAppear(perform: {
            if let transactionToEdit = transactionToEdit {
                amount = transactionToEdit.amount
                transactionTtile = transactionToEdit.title
                selectedTransactionType = transactionToEdit.type
            }
        })
        .padding(.top)
        .alert(alertTitle, isPresented: $showAlert) {
            Button {
                
            } label: {
                Text("OK")
            }

        } message: {
            Text(alertMessage)
        }

    }
}

#Preview {
    AddTransactionView(transactions: .constant([]))
}
