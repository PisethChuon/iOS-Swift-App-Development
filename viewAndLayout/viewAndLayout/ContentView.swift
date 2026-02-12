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

            HStack {
                Text("Left")
                Spacer(.maximum(x: 10, y: 10))
                Text("Right")
            }
                
                
                
        }
    }
}

#Preview {
    ContentView()
}
