//
//  ContentView.swift
//  viewAndLayout
//
//  Created by chuonpiseth on 8/2/26.
//

import SwiftUI

struct ContentView: View {

    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(Font.largeTitle)
            Button("Increase") {
                count += 1
            }
        }
        
    }
}

#Preview {
    ContentView()
}
