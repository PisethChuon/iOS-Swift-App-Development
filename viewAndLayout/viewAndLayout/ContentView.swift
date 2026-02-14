//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let name: String = "Chuon Piseth"
        let job = "iOS Developer at ABA"
        let status: Int = 1
        
        VStack {
            Text(name)
                .font(Font.largeTitle)
                .bold()
            Text(job)
                .foregroundStyle(.gray)
                .lineLimit(1)
                .truncationMode(.tail)
            if status == 1 {
                Text("Online")
                    .foregroundStyle(.green)
            } else if status == 0 {
                Text("Offline")
                    .foregroundStyle(.red)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
