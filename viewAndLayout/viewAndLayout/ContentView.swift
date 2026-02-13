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
            Text("This is a very long text that will wrap into multiple lines automatically.")
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ContentView()
}
