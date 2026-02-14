//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            print("Tapped!")
        } label: {
            Label("Send", systemImage: "paperplane.fill")
        }
    }
}

#Preview {
    ContentView()
}
