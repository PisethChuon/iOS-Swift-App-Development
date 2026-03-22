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
                
            }, label: {
                Text("Create")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(Color(.white))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryLightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            })
            .padding(.horizontal, 30)
            Spacer()
        }
    }
}

#Preview {
    AddTransactionView()
}
