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

            GeometryReader { geometry in
                Text("Half Width")
                    .frame(height: geometry.size.height)
                    .background(Color.orange)
            }
                
                
                
        }
    }
}

#Preview {
    ContentView()
}
