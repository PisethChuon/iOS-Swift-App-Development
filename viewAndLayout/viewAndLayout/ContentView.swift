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
         Image(systemName: "heart.fill")
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
                .font(.system(size: 100))
        }
    }
}

#Preview {
    ContentView()
}
