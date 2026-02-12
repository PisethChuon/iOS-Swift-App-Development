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

            Text("Top Leading")
                .frame(width: 200, height: 100, alignment: .bottomTrailing)
                .background(Color.yellow)
        }
    }
}

#Preview {
    ContentView()
}
