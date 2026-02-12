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
            Ellipse()
                .fill(Color.purple)
                .frame(width: 200, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(height: 100)
            Text("Hello")
                .frame(width: 200, height: 30, alignment: .bottomTrailing)
                .border(.gray)
        }
    }
}

#Preview {
    ContentView()
}
