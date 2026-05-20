//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount: String = ""
    @State private var conversion: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Amount")
                .font(.system(size: 15))
            TextField("", text: $amount)
                .font(.system(size: 18, weight: .semibold))
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.clear)
                        .stroke(Color.gray, lineWidth: 1)
                }
            HStack {
                Spacer()
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.vertical)
                Spacer()
            }
            
            Text("Converted To")
                .font(.system(size: 15))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
