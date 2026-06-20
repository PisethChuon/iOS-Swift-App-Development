//
//  ContentView.swift
//  GridPractice
//
//  Created by chuonpiseth on 20/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(1...20, id: \.self) { number in
                    Text("\(number)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue.opacity(0.2))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
