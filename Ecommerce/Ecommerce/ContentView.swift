//
//  ContentView.swift
//  Ecommerce
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Ecommerce")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
            }
            
            .overlay(alignment: .trailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart.fill")
                })
            }
            .padding(.trailing)
            
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}
