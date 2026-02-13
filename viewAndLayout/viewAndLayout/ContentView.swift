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
            Text("This is a block of text that will show up in a text element as multiple lines. The text will fill the available space, and then, eventually, be truncated.")
                .lineLimit(1)
                .minimumScaleFactor(4.0)
        }
    }
}

#Preview {
    ContentView()
}
