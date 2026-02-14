//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Chuon Piseth")
                .font(Font.largeTitle)
                .bold()
            Text("iOS Developer at ABA")
                .foregroundStyle(.gray)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

#Preview {
    ContentView()
}
